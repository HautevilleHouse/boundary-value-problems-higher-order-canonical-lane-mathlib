import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsHigherOrder

def gateClosed (A : AdmissibleBVPHOClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleBVPHOClass) :
    gateClosed A := by
  exact A.gateWitness

end BoundaryValueProblemsHigherOrder
end HautevilleHouse