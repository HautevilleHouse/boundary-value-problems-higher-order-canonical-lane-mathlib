import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BoundaryValueProblemsHigherOrderCanonicalLaneLean.EllipticRegularity

namespace HautevilleHouse
namespace BoundaryValueProblemsHigherOrderCanonicalLaneLean

structure ExistenceAndUniquenessPackage {S : SobolevSpacePackage} {W : WeakFormulationPackage S}
    (R : EllipticRegularityPackage W) where
  existence : Prop
  uniqueness : Prop
  continuousDependence : Prop

structure ExistenceAndUniquenessEvidence {S : SobolevSpacePackage} {W : WeakFormulationPackage S}
    {R : EllipticRegularityPackage W} (U : ExistenceAndUniquenessPackage R) where
  existenceClosed : U.existence
  uniquenessClosed : U.uniqueness
  continuousDependenceClosed : U.continuousDependence

def ExistenceAndUniquenessClosed {S : SobolevSpacePackage} {W : WeakFormulationPackage S}
    {R : EllipticRegularityPackage W} (U : ExistenceAndUniquenessPackage R) : Prop :=
  U.existence ∧ U.uniqueness ∧ U.continuousDependence

theorem existence_and_uniqueness_closed_from_evidence {S : SobolevSpacePackage} {W : WeakFormulationPackage S}
    {R : EllipticRegularityPackage W} (U : ExistenceAndUniquenessPackage R)
    (E : ExistenceAndUniquenessEvidence U) : ExistenceAndUniquenessClosed U := by
  exact And.intro E.existenceClosed (And.intro E.uniquenessClosed E.continuousDependenceClosed)

end BoundaryValueProblemsHigherOrderCanonicalLaneLean
end HautevilleHouse