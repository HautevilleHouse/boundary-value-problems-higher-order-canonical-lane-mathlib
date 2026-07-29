import canonicalLaneMathlib.AdmissibleClass

/-!
# Boundary Condition Package
-/

namespace HautevilleHouse
namespace BoundaryValueProblemsHigherOrder

structure BoundaryConditionPackage (D : DifferentialOperatorPackage) where
  boundaryOperator : D.operatorOrder → Type u
  traceOperator : Type v
  dirichletCondition : Prop
  neumannCondition : Prop
  robinCondition : Prop
  compatibility : Prop

structure BoundaryConditionEvidence {D : DifferentialOperatorPackage}
    (B : BoundaryConditionPackage D) where
  dirichletClosed : B.dirichletCondition
  neumannClosed : B.neumannCondition
  robinClosed : B.robinCondition
  compatibilityClosed : B.compatibility

def BoundaryConditionClosed {D : DifferentialOperatorPackage}
    (B : BoundaryConditionPackage D) : Prop :=
  B.dirichletCondition ∧ B.neumannCondition ∧ B.robinCondition ∧ B.compatibility

theorem boundary_condition_closed_from_evidence {D : DifferentialOperatorPackage}
    (B : BoundaryConditionPackage D) (E : BoundaryConditionEvidence B) :
    BoundaryConditionClosed B := by
  exact And.intro E.dirichletClosed (And.intro E.neumannClosed (And.intro E.robinClosed E.compatibilityClosed))

end BoundaryValueProblemsHigherOrder
end HautevilleHouse