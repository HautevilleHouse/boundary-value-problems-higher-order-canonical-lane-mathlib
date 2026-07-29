import canonicalLaneMathlib.AdmissibleClass

/-!
# Higher-Order Boundary Value Problem Package
-/

namespace HautevilleHouse
namespace BoundaryValueProblemsHigherOrder

structure HigherOrderBVPPackage (D : DifferentialOperatorPackage) (B : BoundaryConditionPackage D) where
  differentialEquation : Prop
  boundaryConditions : Prop
  regularitySobolev : Prop
  wellPosedness : Prop

structure HigherOrderBVPEvidence {D : DifferentialOperatorPackage} {B : BoundaryConditionPackage D}
    (H : HigherOrderBVPPackage D B) where
  differentialEquationClosed : H.differentialEquation
  boundaryConditionsClosed : H.boundaryConditions
  regularitySobolevClosed : H.regularitySobolev
  wellPosednessClosed : H.wellPosedness

def HigherOrderBVPClosed {D : DifferentialOperatorPackage} {B : BoundaryConditionPackage D}
    (H : HigherOrderBVPPackage D B) : Prop :=
  H.differentialEquation ∧ H.boundaryConditions ∧ H.regularitySobolev ∧ H.wellPosedness

theorem higher_order_bvp_closed_from_evidence
    {D : DifferentialOperatorPackage} {B : BoundaryConditionPackage D}
    (H : HigherOrderBVPPackage D B) (E : HigherOrderBVPEvidence H) :
    HigherOrderBVPClosed H := by
  exact And.intro E.differentialEquationClosed
    (And.intro E.boundaryConditionsClosed
      (And.intro E.regularitySobolevClosed E.wellPosednessClosed))

end BoundaryValueProblemsHigherOrder
end HautevilleHouse