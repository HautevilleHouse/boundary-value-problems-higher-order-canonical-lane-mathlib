import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BoundaryValueProblemsHigherOrderCanonicalLaneLean.LaxMilgramLemma

namespace HautevilleHouse
namespace BoundaryValueProblemsHigherOrderCanonicalLaneLean

structure FiniteElementPackage (n : Nat) (B : BoundaryConditionPackage n) (S : SobolevSpacePackage n B) (V : VariationalFormulationPackage n B S) (L : LaxMilgramPackage n B S V) where
  mesh : Prop
  basisFunctions : Prop
  stiffnessMatrix : Prop
  massMatrix : Prop
  loadVector : Prop
  approximationProperty : Prop
  errorEstimate : Prop

def FiniteElementDiscretizationClosed {n : Nat} {B : BoundaryConditionPackage n} {S : SobolevSpacePackage n B} {V : VariationalFormulationPackage n B S} {L : LaxMilgramPackage n B S V} (F : FiniteElementPackage n B S V L) : Prop :=
  F.approximationProperty ∧ F.errorEstimate

end BoundaryValueProblemsHigherOrderCanonicalLaneLean
end HautevilleHouse
