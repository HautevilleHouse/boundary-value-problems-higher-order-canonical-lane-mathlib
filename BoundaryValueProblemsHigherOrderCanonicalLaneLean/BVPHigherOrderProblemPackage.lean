import HautevilleHouse.BoundaryValueProblemsHigherOrderCanonicalLaneLean.BVPHigherOrderAdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsHigherOrderCanonicalLaneLean

structure SobolevSpace where
  index : ℕ
  domain : Type u
  completeness : Prop

structure LinearEllipticOperator (Ω : Type u) where
  order : ℕ
  coefficients : Type v
  ellipticityCondition : Prop
  fredholmProperty : Prop

structure BoundaryCondition (Ω : Type u) where
  bdry : Set Ω
  type : String
  wellPosed : Prop

structure HigherOrderBVPPackage where
  domain : Type u
  sobolevSpace : SobolevSpace
  operator : LinearEllipticOperator domain
  boundaryConditions : List (BoundaryCondition domain)
  solutionSpace : Type v
  existence : Prop
  uniqueness : Prop
  regularity : Prop

structure HigherOrderBVPEvidence (P : HigherOrderBVPPackage) where
  sobolevComplete : P.sobolevSpace.completeness
  elliptic : P.operator.ellipticityCondition
  fredholm : P.operator.fredholmProperty
  bcsWellPosed : ∀ (bc : BoundaryCondition P.domain), bc.wellPosed
  existenceHolds : P.existence
  uniquenessHolds : P.uniqueness
  regularityHolds : P.regularity

def HigherOrderBVPClosed (P : HigherOrderBVPPackage) : Prop :=
  P.operator.ellipticityCondition ∧ P.operator.fredholmProperty ∧
  (∀ (bc : BoundaryCondition P.domain), bc.wellPosed) ∧
  P.existence ∧ P.uniqueness ∧ P.regularity

theorem higher_order_bvp_closed_from_evidence
    (P : HigherOrderBVPPackage) (E : HigherOrderBVPEvidence P) :
    HigherOrderBVPClosed P := by
  refine And.intro E.elliptic
    (And.intro E.fredholm
      (And.intro (fun bc => E.bcsWellPosed bc)
        (And.intro E.existenceHolds
          (And.intro E.uniquenessHolds E.regularityHolds))))

-- Construction of a BVPSpace from a closed package
def BVPSpace.fromPackage (P : HigherOrderBVPPackage) (h : HigherOrderBVPClosed P) : BVPSpace :=
  {
    carrier := P.domain
    topology := by infer_instance
    conclusion := h
  }

end BoundaryValueProblemsHigherOrderCanonicalLaneLean
end HautevilleHouse
