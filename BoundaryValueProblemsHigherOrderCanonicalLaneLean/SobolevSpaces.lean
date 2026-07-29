import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BoundaryValueProblemsHigherOrderCanonicalLaneLean.BoundaryConditions

namespace HautevilleHouse
namespace BoundaryValueProblemsHigherOrderCanonicalLaneLean

structure SobolevSpacePackage (n : Nat) (B : BoundaryConditionPackage n) where
  innerProduct : Prop
  norm : Prop
  completeness : Prop
  traceTheorem : Prop

def SobolevSpaceClosed {n : Nat} {B : BoundaryConditionPackage n} (S : SobolevSpacePackage n B) : Prop :=
  S.completeness ∧ S.traceTheorem

end BoundaryValueProblemsHigherOrderCanonicalLaneLean
end HautevilleHouse
