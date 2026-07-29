import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsHigherOrderCanonicalLaneLean

structure BoundaryValueProblemPackage (n : Nat) where
  domain : Type u
  boundary : Type v
  differentialOperator : Type w
  order : n.succ
  linear : Prop
  coercive : Prop
  wellPosed : Prop

structure BoundaryValueProblemEvidence {n : Nat} (B : BoundaryValueProblemPackage n) where
  linearClosed : B.linear
  coerciveClosed : B.coercive
  wellPosedClosed : B.wellPosed

def BoundaryValueProblemClosed {n : Nat} (B : BoundaryValueProblemPackage n) : Prop :=
  B.linear ∧ B.coercive ∧ B.wellPosed

theorem boundary_value_problem_closed_from_evidence
    {n : Nat} (B : BoundaryValueProblemPackage n) (E : BoundaryValueProblemEvidence B) :
    BoundaryValueProblemClosed B := by
  exact And.intro E.linearClosed (And.intro E.coerciveClosed E.wellPosedClosed)

end BoundaryValueProblemsHigherOrderCanonicalLaneLean
end HautevilleHouse