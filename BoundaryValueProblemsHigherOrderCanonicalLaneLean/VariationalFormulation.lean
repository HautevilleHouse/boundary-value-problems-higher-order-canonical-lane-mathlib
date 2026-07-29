import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BoundaryValueProblemsHigherOrderCanonicalLaneLean.SobolevSpaces

namespace HautevilleHouse
namespace BoundaryValueProblemsHigherOrderCanonicalLaneLean

structure VariationalFormulationPackage (n : Nat) (B : BoundaryConditionPackage n) (S : SobolevSpacePackage n B) where
  bilinearForm : Prop
  linearForm : Prop
  coercivity : Prop
  continuity : Prop

def VariationalFormulationClosed {n : Nat} {B : BoundaryConditionPackage n} {S : SobolevSpacePackage n B} (V : VariationalFormulationPackage n B S) : Prop :=
  V.coercivity ∧ V.continuity

end BoundaryValueProblemsHigherOrderCanonicalLaneLean
end HautevilleHouse
