import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsHigherOrder

def bridgeClosed (A : AdmissibleBVPHOClass) : Prop :=
  BVPHOWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleBVPHOClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end BoundaryValueProblemsHigherOrder
end HautevilleHouse