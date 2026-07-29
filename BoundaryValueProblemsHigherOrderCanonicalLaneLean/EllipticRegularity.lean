import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BoundaryValueProblemsHigherOrderCanonicalLaneLean.WeakFormulation

namespace HautevilleHouse
namespace BoundaryValueProblemsHigherOrderCanonicalLaneLean

structure EllipticRegularityPackage {S : SobolevSpacePackage} (W : WeakFormulationPackage S) where
  interiorRegularity : Prop
  boundaryRegularity : Prop
  gainOfRegularity : Prop

structure EllipticRegularityEvidence {S : SobolevSpacePackage} {W : WeakFormulationPackage S}
    (R : EllipticRegularityPackage W) where
  interiorRegularityClosed : R.interiorRegularity
  boundaryRegularityClosed : R.boundaryRegularity
  gainOfRegularityClosed : R.gainOfRegularity

def EllipticRegularityClosed {S : SobolevSpacePackage} {W : WeakFormulationPackage S}
    (R : EllipticRegularityPackage W) : Prop :=
  R.interiorRegularity ∧ R.boundaryRegularity ∧ R.gainOfRegularity

theorem elliptic_regularity_closed_from_evidence {S : SobolevSpacePackage} {W : WeakFormulationPackage S}
    (R : EllipticRegularityPackage W) (E : EllipticRegularityEvidence R) : EllipticRegularityClosed R := by
  exact And.intro E.interiorRegularityClosed (And.intro E.boundaryRegularityClosed E.gainOfRegularityClosed)

end BoundaryValueProblemsHigherOrderCanonicalLaneLean
end HautevilleHouse