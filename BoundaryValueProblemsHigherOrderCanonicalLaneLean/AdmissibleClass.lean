import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsHigherOrderCanonicalLaneLean

structure HigherOrderBVPAdmittedObject where
  carrier : Type
  topology : TopologicalSpace carrier
  domainDimension : Nat
  boundaryRegularity : Nat
  differentialOrder : Nat
  pdeType : String
  boundaryConditionFormulated : Prop
  coercivityEstablished : Prop
  existenceProved : Prop
  conclusion : existenceProved

structure AdmissibleClass where
  object : HigherOrderBVPAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  (bridgeClosed A) ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end BoundaryValueProblemsHigherOrderCanonicalLaneLean
end HautevilleHouse
