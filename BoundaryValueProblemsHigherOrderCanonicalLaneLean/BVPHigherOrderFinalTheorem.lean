import HautevilleHouse.BoundaryValueProblemsHigherOrderCanonicalLaneLean.BVPHigherOrderProblemPackage

namespace HautevilleHouse
namespace BoundaryValueProblemsHigherOrderCanonicalLaneLean

def ConstrainedBVPClosure (A : BVPAdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_bvp_endgame (A : BVPAdmissibleClass) :
    ConstrainedBVPClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end BoundaryValueProblemsHigherOrderCanonicalLaneLean
end HautevilleHouse
