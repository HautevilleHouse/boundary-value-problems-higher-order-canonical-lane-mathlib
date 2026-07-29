import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsHigherOrderCanonicalLaneLean

structure MaximumPrinciplePackage where
  operatorOrder : ℕ
  ellipticityCondition : Prop
  weakMaximumPrinciple : Prop
  strongMaximumPrinciple : Prop
  comparisonPrinciple : Prop

structure MaximumPrincipleEvidence (M : MaximumPrinciplePackage) where
  weakMaximumPrincipleClosed : M.weakMaximumPrinciple
  strongMaximumPrincipleClosed : M.strongMaximumPrinciple
  comparisonPrincipleClosed : M.comparisonPrinciple

def MaximumPrincipleClosed (M : MaximumPrinciplePackage) : Prop :=
  M.weakMaximumPrinciple ∧ M.strongMaximumPrinciple ∧ M.comparisonPrinciple

theorem maximum_principle_closed_from_evidence (M : MaximumPrinciplePackage)
    (E : MaximumPrincipleEvidence M) : MaximumPrincipleClosed M := by
  exact And.intro E.weakMaximumPrincipleClosed
    (And.intro E.strongMaximumPrincipleClosed E.comparisonPrincipleClosed)

end BoundaryValueProblemsHigherOrderCanonicalLaneLean
end HautevilleHouse