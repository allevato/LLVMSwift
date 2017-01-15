import cllvm

/// An `IRGlobal` is a value, alias, or function that exists at the top level of
/// an LLVM module.
public protocol IRGlobal: IRValue {}

extension IRGlobal {
  /// Retrieves the linkage information for this global.
  public var linkage: Linkage {
    get { return Linkage(llvm: LLVMGetLinkage(asLLVM())) }
    set { LLVMSetLinkage(asLLVM(), newValue.llvm) }
  }

  /// Retrieves the visibility style for this global.
  public var visibility: Visibility {
    get { return Visibility(llvm: LLVMGetVisibility(asLLVM())) }
    set { LLVMSetVisibility(asLLVM(), newValue.llvm) }
  }
}