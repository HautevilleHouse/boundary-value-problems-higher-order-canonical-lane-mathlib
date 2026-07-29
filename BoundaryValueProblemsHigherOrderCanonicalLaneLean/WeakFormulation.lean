import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BoundaryValueProblemsHigherOrderCanonicalLaneLean.SobolevSpaces

namespace HautevilleHouse
namespace BoundaryValueProblemsHigherOrderCanonicalLaneLean

structure WeakFormulationPackage (S : SobolevSpacePackage) where
  bilinearForm : Type
  coercivity : Prop
  boundedness : Prop
  wellPosedness : Prop

structure WeakFormulationEvidence {S : SobolevSpacePackage} (W : WeakFormulationPackage S) where
  coercivityClosed : W.coercivity
  boundednessClosed : W.boundedness
  wellPosednessClosed : W.wellPosedness

def WeakFormulationClosed {S : SobolevSpacePackage} (W : WeakFormulationPackage S) : Prop :=
  W.coercivity ∧ W.boundedness ∧ W.wellPosedness

theorem weak_formulation_closed_from_evidence {S : SobolevSpacePackage} (W : WeakFormulationPackage S)
    (E : WeakFormulationEvidence W) : WeakFormulationClosed W := by
  exact And.intro E.coercivityClosed (And.intro E.boundednessClosed E.wellPosednessClosed)

end BoundaryValueProblemsHigherOrderCanonicalLaneLean
end HautevilleHouse