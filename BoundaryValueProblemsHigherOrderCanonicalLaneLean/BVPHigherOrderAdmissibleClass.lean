import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsHigherOrderCanonicalLaneLean

structure BVPSpace where
  carrier : Type
  topology : TopologicalSpace carrier
  conclusion : Prop

structure BVPAdmissibleClass where
  object : BVPSpace
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def bvpAdmittedClosure (A : BVPAdmissibleClass) : Prop :=
  BVPSpaceClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

def bridgeClosed (A : BVPAdmissibleClass) : Prop :=
  BVPSpaceClosed A.object

theorem bridge_from_admissible_class (A : BVPAdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

def gateClosed (A : BVPAdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : BVPAdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

end BoundaryValueProblemsHigherOrderCanonicalLaneLean
end HautevilleHouse
