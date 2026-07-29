import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BoundaryValueProblemsHigherOrderCanonicalLaneLean.VariationalFormulation

namespace HautevilleHouse
namespace BoundaryValueProblemsHigherOrderCanonicalLaneLean

structure LaxMilgramPackage (n : Nat) (B : BoundaryConditionPackage n) (S : SobolevSpacePackage n B) (V : VariationalFormulationPackage n B S) where
  existence : Prop
  uniqueness : Prop
  stability : Prop
  coercivityCondition : V.coercivity
  continuityCondition : V.continuity

def LaxMilgramClosed {n : Nat} {B : BoundaryConditionPackage n} {S : SobolevSpacePackage n B} {V : VariationalFormulationPackage n B S} (L : LaxMilgramPackage n B S V) : Prop :=
  L.existence ∧ L.uniqueness ∧ L.stability

theorem lax_milgram_closed_from_evidence {n : Nat} {B : BoundaryConditionPackage n} {S : SobolevSpacePackage n B} {V : VariationalFormulationPackage n B S} (L : LaxMilgramPackage n B S V) : LaxMilgramClosed L := by
  exact And.intro L.existence (And.intro L.uniqueness L.stability)

end BoundaryValueProblemsHigherOrderCanonicalLaneLean
end HautevilleHouse
