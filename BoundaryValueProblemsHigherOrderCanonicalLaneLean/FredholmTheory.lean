import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsHigherOrderCanonicalLaneLean

structure FredholmPackage where
  index : ℤ
  kernelFiniteDimensional : Prop
  cokernelFiniteDimensional : Prop
  closedRange : Prop

structure FredholmEvidence (F : FredholmPackage) where
  kernelFiniteDimensionalClosed : F.kernelFiniteDimensional
  cokernelFiniteDimensionalClosed : F.cokernelFiniteDimensional
  closedRangeClosed : F.closedRange

def FredholmClosed (F : FredholmPackage) : Prop :=
  F.kernelFiniteDimensional ∧ F.cokernelFiniteDimensional ∧ F.closedRange

theorem fredholm_closed_from_evidence (F : FredholmPackage)
    (E : FredholmEvidence F) : FredholmClosed F := by
  exact And.intro E.kernelFiniteDimensionalClosed
    (And.intro E.cokernelFiniteDimensionalClosed E.closedRangeClosed)

end BoundaryValueProblemsHigherOrderCanonicalLaneLean
end HautevilleHouse