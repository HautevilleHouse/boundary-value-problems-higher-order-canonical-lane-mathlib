import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BoundaryValueProblemsHigherOrderCanonicalLaneLean.FiniteElementDiscretization

namespace HautevilleHouse
namespace BoundaryValueProblemsHigherOrderCanonicalLaneLean

structure BoundaryValueGatewayPackage (n : Nat) (B : BoundaryConditionPackage n) (S : SobolevSpacePackage n B) (V : VariationalFormulationPackage n B S) (L : LaxMilgramPackage n B S V) (F : FiniteElementPackage n B S V L) where
  problemClosed : Prop
  approximationClosed : Prop

def GatewayClosed {n : Nat} {B : BoundaryConditionPackage n} {S : SobolevSpacePackage n B} {V : VariationalFormulationPackage n B S} {L : LaxMilgramPackage n B S V} {F : FiniteElementPackage n B S V L} (G : BoundaryValueGatewayPackage n B S V L F) : Prop :=
  G.problemClosed ∧ G.approximationClosed

end BoundaryValueProblemsHigherOrderCanonicalLaneLean
end HautevilleHouse
