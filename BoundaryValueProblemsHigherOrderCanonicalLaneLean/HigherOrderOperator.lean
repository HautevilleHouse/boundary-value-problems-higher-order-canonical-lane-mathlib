import BoundaryValueProblemsHigherOrderCanonicalLaneLean.SobolevSpaces

namespace HautevilleHouse
namespace BoundaryValueProblemsHigherOrderCanonicalLaneLean

structure HigherOrderOperatorPackage (S : SobolevSpacePackage) where
  order : Nat
  coefficients : Prop
  ellipticityCondition : Prop
  formalAdjoint : Prop
  strongSolutionExistence : Prop

structure HigherOrderOperatorEvidence {S : SobolevSpacePackage} (O : HigherOrderOperatorPackage S) where
  ellipticityConditionClosed : O.ellipticityCondition
  formalAdjointClosed : O.formalAdjoint
  strongSolutionExistenceClosed : O.strongSolutionExistence

def HigherOrderOperatorClosed {S : SobolevSpacePackage} (O : HigherOrderOperatorPackage S) : Prop :=
  O.ellipticityCondition ∧ O.formalAdjoint ∧ O.strongSolutionExistence

theorem higher_order_operator_closed_from_evidence
    {S : SobolevSpacePackage} (O : HigherOrderOperatorPackage S)
    (E : HigherOrderOperatorEvidence O) : HigherOrderOperatorClosed O := by
  exact And.intro E.ellipticityConditionClosed
    (And.intro E.formalAdjointClosed E.strongSolutionExistenceClosed)

end BoundaryValueProblemsHigherOrderCanonicalLaneLean
end HautevilleHouse