import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsHigherOrderCanonicalLaneLean

structure GreenFunctionPackage {n : Nat} (B : BoundaryValueProblemPackage n) where
  kernelExists : Prop
  symmetry : Prop
  regularity : Prop
  representationFormula : Prop

structure GreenFunctionEvidence {n : Nat} {B : BoundaryValueProblemPackage n} (G : GreenFunctionPackage B) where
  kernelExistsClosed : G.kernelExists
  symmetryClosed : G.symmetry
  regularityClosed : G.regularity
  representationFormulaClosed : G.representationFormula

def GreenFunctionClosed {n : Nat} {B : BoundaryValueProblemPackage n} (G : GreenFunctionPackage B) : Prop :=
  G.kernelExists ∧ G.symmetry ∧ G.regularity ∧ G.representationFormula

theorem green_function_closed_from_evidence
    {n : Nat} {B : BoundaryValueProblemPackage n} (G : GreenFunctionPackage B)
    (E : GreenFunctionEvidence G) : GreenFunctionClosed G := by
  exact And.intro E.kernelExistsClosed
    (And.intro E.symmetryClosed
      (And.intro E.regularityClosed E.representationFormulaClosed))

end BoundaryValueProblemsHigherOrderCanonicalLaneLean
end HautevilleHouse