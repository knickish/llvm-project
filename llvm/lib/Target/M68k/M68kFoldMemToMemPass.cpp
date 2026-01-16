//===-- M68kFoldMemToMemPass.cpp - Fold mem-to-mem moves --------*- C++ -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
///
/// \file
/// This file contains a post-scheduling pass that folds a load followed by a
/// store into a single mem-to-mem move when it is safe to do so.
///
//===----------------------------------------------------------------------===//

#include "M68k.h"
#include "M68kInstrInfo.h"
#include "M68kSubtarget.h"

#include "llvm/CodeGen/MachineFunctionPass.h"
#include "llvm/CodeGen/MachineInstrBuilder.h"
#include "llvm/CodeGen/MachineMemOperand.h"
#include "llvm/CodeGen/TargetRegisterInfo.h"

using namespace llvm;

#define DEBUG_TYPE "m68k-fold-mem-mem"
#define PASS_NAME "M68k fold mem-to-mem moves"

namespace {

enum class MemMode : uint8_t { j, o, e, k, q, f, p, b };

struct MovInstrInfo {
  unsigned Size = 0;
  MemMode MemAddrMode = MemMode::j;
  Register Reg;
  unsigned MemOpStart = 0;
  unsigned MemOpEnd = 0;
  bool IsLoad = false;
  bool IsStore = false;
  bool SideEffectMem = false;
};

class M68kFoldMemToMem : public MachineFunctionPass {
public:
  static char ID;

  M68kFoldMemToMem() : MachineFunctionPass(ID) {}

  bool runOnMachineFunction(MachineFunction &MF) override;

private:
  const M68kInstrInfo *TII = nullptr;
  const M68kRegisterInfo *TRI = nullptr;

  unsigned getMovMMOpcode(unsigned Size, MemMode Dst, MemMode Src) const;

  static bool isSideEffectMemMode(MemMode Mode);

  bool getMovInfo(const MachineInstr &MI, MovInstrInfo &Info) const;

  static bool memOperandsUseReg(const MachineInstr &MI, unsigned Start,
                                unsigned End, Register Reg,
                                const TargetRegisterInfo &TRI);

  static bool regUsedAfter(MachineBasicBlock &MBB,
                           MachineBasicBlock::iterator MI, Register Reg,
                           const TargetRegisterInfo &TRI);

  static MachineBasicBlock::iterator
  prevNonDebug(MachineBasicBlock::iterator MI, MachineBasicBlock &MBB);
};

static constexpr unsigned makeMovKey(unsigned Size, MemMode Dst, MemMode Src) {
  return (Size << 16) | (static_cast<unsigned>(Dst) << 8) |
         static_cast<unsigned>(Src);
}

bool M68kFoldMemToMem::isSideEffectMemMode(MemMode Mode) {
  return Mode == MemMode::o || Mode == MemMode::e;
}

bool M68kFoldMemToMem::getMovInfo(const MachineInstr &MI,
                                  MovInstrInfo &Info) const {
  unsigned NumExpOps = MI.getNumExplicitOperands();
  if (NumExpOps < 2)
    return false;

  auto setLoadInfo = [&](unsigned Size, MemMode Mode) -> bool {
    if (!MI.getOperand(0).isReg())
      return false;
    Info.IsLoad = true;
    Info.Size = Size;
    Info.Reg = MI.getOperand(0).getReg();
    Info.MemAddrMode = Mode;
    Info.MemOpStart = 1;
    Info.MemOpEnd = NumExpOps;
    Info.SideEffectMem = isSideEffectMemMode(Mode);
    return true;
  };

  auto setStoreInfo = [&](unsigned Size, MemMode Mode) -> bool {
    unsigned SrcIdx = NumExpOps - 1;
    if (!MI.getOperand(SrcIdx).isReg())
      return false;
    Info.IsStore = true;
    Info.Size = Size;
    Info.Reg = MI.getOperand(SrcIdx).getReg();
    Info.MemAddrMode = Mode;
    Info.MemOpStart = 0;
    Info.MemOpEnd = SrcIdx;
    Info.SideEffectMem = isSideEffectMemMode(Mode);
    return true;
  };

  switch (MI.getOpcode()) {
#define M68K_LOAD_CASE(size, reg, mem)                                        \
  case M68k::MOV##size##reg##mem:                                             \
    return setLoadInfo(size, MemMode::mem);
#define M68K_STORE_CASE(size, mem, reg)                                       \
  case M68k::MOV##size##mem##reg:                                             \
    return setStoreInfo(size, MemMode::mem);

#define M68K_LOAD_CASES_FOR_REG(size, reg)                                    \
  M68K_LOAD_CASE(size, reg, j)                                                \
  M68K_LOAD_CASE(size, reg, o)                                                \
  M68K_LOAD_CASE(size, reg, e)                                                \
  M68K_LOAD_CASE(size, reg, k)                                                \
  M68K_LOAD_CASE(size, reg, q)                                                \
  M68K_LOAD_CASE(size, reg, f)                                                \
  M68K_LOAD_CASE(size, reg, p)                                                \
  M68K_LOAD_CASE(size, reg, b)

#define M68K_STORE_CASES_FOR_REG(size, reg)                                   \
  M68K_STORE_CASE(size, j, reg)                                               \
  M68K_STORE_CASE(size, o, reg)                                               \
  M68K_STORE_CASE(size, e, reg)                                               \
  M68K_STORE_CASE(size, k, reg)                                               \
  M68K_STORE_CASE(size, q, reg)                                               \
  M68K_STORE_CASE(size, f, reg)                                               \
  M68K_STORE_CASE(size, p, reg)                                               \
  M68K_STORE_CASE(size, b, reg)

    M68K_LOAD_CASES_FOR_REG(8, d)
    M68K_LOAD_CASES_FOR_REG(16, d)
    M68K_LOAD_CASES_FOR_REG(16, a)
    M68K_LOAD_CASES_FOR_REG(16, r)
    M68K_LOAD_CASES_FOR_REG(32, d)
    M68K_LOAD_CASES_FOR_REG(32, a)
    M68K_LOAD_CASES_FOR_REG(32, r)

    M68K_STORE_CASES_FOR_REG(8, d)
    M68K_STORE_CASES_FOR_REG(16, d)
    M68K_STORE_CASES_FOR_REG(16, a)
    M68K_STORE_CASES_FOR_REG(16, r)
    M68K_STORE_CASES_FOR_REG(32, d)
    M68K_STORE_CASES_FOR_REG(32, a)
    M68K_STORE_CASES_FOR_REG(32, r)

  default:
    return false;
  }

#undef M68K_LOAD_CASE
#undef M68K_STORE_CASE
#undef M68K_LOAD_CASES_FOR_REG
#undef M68K_STORE_CASES_FOR_REG
}

bool M68kFoldMemToMem::memOperandsUseReg(const MachineInstr &MI, unsigned Start,
                                         unsigned End, Register Reg,
                                         const TargetRegisterInfo &TRI) {
  if (!Reg)
    return false;

  for (unsigned I = Start; I < End; ++I) {
    const MachineOperand &MO = MI.getOperand(I);
    if (MO.isReg() && MO.getReg() && TRI.regsOverlap(MO.getReg(), Reg))
      return true;
  }
  return false;
}

bool M68kFoldMemToMem::regUsedAfter(MachineBasicBlock &MBB,
                                    MachineBasicBlock::iterator MI,
                                    Register Reg,
                                    const TargetRegisterInfo &TRI) {
  for (auto It = std::next(MI), End = MBB.end(); It != End; ++It) {
    if (It->isDebugInstr())
      continue;
    if (It->readsRegister(Reg, &TRI))
      return true;
    if (It->definesRegister(Reg, &TRI))
      return false;
  }
  return false;
}

MachineBasicBlock::iterator
M68kFoldMemToMem::prevNonDebug(MachineBasicBlock::iterator MI,
                               MachineBasicBlock &MBB) {
  while (MI != MBB.begin()) {
    --MI;
    if (!MI->isDebugInstr())
      return MI;
  }
  return MBB.end();
}

unsigned M68kFoldMemToMem::getMovMMOpcode(unsigned Size, MemMode Dst,
                                          MemMode Src) const {
  switch (makeMovKey(Size, Dst, Src)) {
#define M68K_MM_CASE(size, dst, src)                                          \
  case makeMovKey(size, MemMode::dst, MemMode::src):                          \
    return M68k::MOV##size##dst##src;

#define M68K_MM_CASES_FOR_DST(size, dst)                                      \
  M68K_MM_CASE(size, dst, j)                                                  \
  M68K_MM_CASE(size, dst, o)                                                  \
  M68K_MM_CASE(size, dst, e)                                                  \
  M68K_MM_CASE(size, dst, k)                                                  \
  M68K_MM_CASE(size, dst, q)                                                  \
  M68K_MM_CASE(size, dst, f)                                                  \
  M68K_MM_CASE(size, dst, p)                                                  \
  M68K_MM_CASE(size, dst, b)

#define M68K_MM_CASES(size)                                                   \
  M68K_MM_CASES_FOR_DST(size, j)                                              \
  M68K_MM_CASES_FOR_DST(size, o)                                              \
  M68K_MM_CASES_FOR_DST(size, e)                                              \
  M68K_MM_CASES_FOR_DST(size, k)                                              \
  M68K_MM_CASES_FOR_DST(size, q)                                              \
  M68K_MM_CASES_FOR_DST(size, f)                                              \
  M68K_MM_CASES_FOR_DST(size, p)                                              \
  M68K_MM_CASES_FOR_DST(size, b)

    M68K_MM_CASES(8)
    M68K_MM_CASES(16)
    M68K_MM_CASES(32)

  default:
    return 0;
  }

#undef M68K_MM_CASE
#undef M68K_MM_CASES_FOR_DST
#undef M68K_MM_CASES
}

bool M68kFoldMemToMem::runOnMachineFunction(MachineFunction &MF) {
  TII = MF.getSubtarget<M68kSubtarget>().getInstrInfo();
  TRI = MF.getSubtarget<M68kSubtarget>().getRegisterInfo();
  bool Changed = false;

  for (auto &MBB : MF) {
    for (auto MI = MBB.begin(); MI != MBB.end();) {
      if (MI->isDebugInstr()) {
        ++MI;
        continue;
      }

      MovInstrInfo StoreInfo;
      if (!getMovInfo(*MI, StoreInfo) || !StoreInfo.IsStore) {
        ++MI;
        continue;
      }

      if (StoreInfo.SideEffectMem || MI->hasOrderedMemoryRef()) {
        ++MI;
        continue;
      }

      auto LoadIt = prevNonDebug(MI, MBB);
      if (LoadIt == MBB.end()) {
        ++MI;
        continue;
      }

      MovInstrInfo LoadInfo;
      if (!getMovInfo(*LoadIt, LoadInfo) || !LoadInfo.IsLoad) {
        ++MI;
        continue;
      }

      if (LoadInfo.SideEffectMem || LoadIt->hasOrderedMemoryRef()) {
        ++MI;
        continue;
      }

      if (LoadInfo.Size != StoreInfo.Size) {
        ++MI;
        continue;
      }

      if (LoadInfo.Reg != StoreInfo.Reg) {
        ++MI;
        continue;
      }

      if (memOperandsUseReg(*MI, StoreInfo.MemOpStart, StoreInfo.MemOpEnd,
                            LoadInfo.Reg, *TRI)) {
        ++MI;
        continue;
      }

      if (regUsedAfter(MBB, MI, LoadInfo.Reg, *TRI)) {
        ++MI;
        continue;
      }

      unsigned MMOpcode =
          getMovMMOpcode(LoadInfo.Size, StoreInfo.MemAddrMode,
                         LoadInfo.MemAddrMode);
      if (!MMOpcode) {
        ++MI;
        continue;
      }

      DebugLoc DL = MI->getDebugLoc();
      MachineInstrBuilder MIB =
          BuildMI(MBB, MI, DL, TII->get(MMOpcode));
      for (unsigned I = StoreInfo.MemOpStart; I < StoreInfo.MemOpEnd; ++I)
        MIB.add(MI->getOperand(I));
      for (unsigned I = LoadInfo.MemOpStart; I < LoadInfo.MemOpEnd; ++I)
        MIB.add(LoadIt->getOperand(I));

      MIB.setMIFlags(MI->getFlags());

      for (MachineMemOperand *MMO : MI->memoperands())
        MIB.addMemOperand(MMO);
      for (MachineMemOperand *MMO : LoadIt->memoperands())
        MIB.addMemOperand(MMO);

      auto NextIt = std::next(MI);
      MBB.erase(LoadIt);
      MBB.erase(MI);
      MI = NextIt;
      Changed = true;
    }
  }

  return Changed;
}

char M68kFoldMemToMem::ID = 0;
} // end anonymous namespace

INITIALIZE_PASS(M68kFoldMemToMem, DEBUG_TYPE, PASS_NAME, false, false)

FunctionPass *llvm::createM68kFoldMemToMemPass() {
  return new M68kFoldMemToMem();
}
