import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsHigherOrderCanonicalLaneLean

structure VariationalFormulationPackage {n : Nat} (B : BoundaryValueProblemPackage n) where
  bilinearForm : Type u
  linearForm : Type v
  coercivity : Prop
  wellPosednessViaLaxMilgram : Prop

structure VariationalFormulationEvidence {n : Nat} {B : BoundaryValueProblemPackage n} (V : VariationalFormulationPackage B) where
  coercivityClosed : V.coercivity
  wellPosednessViaLaxMilgramClosed : V.wellPosednessViaLaxMilgram

def VariationalFormulationClosed {n : Nat} {B : BoundaryValueProblemPackage n} (V : VariationalFormulationPackage B) : Prop :=
  V.coercivity ∧ V.wellPosednessViaLaxMilgram

theorem variational_formulation_closed_from_evidence
    {n : Nat} {B : BoundaryValueProblemPackage n} (V : VariationalFormulationPackage B)
    (E : VariationalFormulationEvidence V) : VariationalFormulationClosed V := by
  exact And.intro E.coercivityClosed E.wellPosednessViaLaxMilgramClosed

end BoundaryValueProblemsHigherOrderCanonicalLaneLean
end HautevilleHouse