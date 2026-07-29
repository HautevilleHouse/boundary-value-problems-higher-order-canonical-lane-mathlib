import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsHigherOrderCanonicalLaneLean

structure RegularityTheoryPackage {S : SobolevSpacePackage} {V : VariationalFormulationPackage S} where
  solutionRegularity : Prop
  interiorEstimates : Prop
  boundaryEstimates : Prop
  ellipticRegularity : Prop

structure RegularityTheoryEvidence {S : SobolevSpacePackage} {V : VariationalFormulationPackage S} (R : RegularityTheoryPackage V) where
  solutionRegularityClosed : R.solutionRegularity
  interiorEstimatesClosed : R.interiorEstimates
  boundaryEstimatesClosed : R.boundaryEstimates
  ellipticRegularityClosed : R.ellipticRegularity

def RegularityTheoryClosed {S : SobolevSpacePackage} {V : VariationalFormulationPackage S} (R : RegularityTheoryPackage V) : Prop :=
  R.solutionRegularity ∧ R.interiorEstimates ∧ R.boundaryEstimates ∧ R.ellipticRegularity

theorem regularity_theory_closed_from_evidence {S : SobolevSpacePackage} {V : VariationalFormulationPackage S} (R : RegularityTheoryPackage V) (E : RegularityTheoryEvidence R) :
    RegularityTheoryClosed R := by
  exact And.intro E.solutionRegularityClosed
    (And.intro E.interiorEstimatesClosed
      (And.intro E.boundaryEstimatesClosed E.ellipticRegularityClosed))

end BoundaryValueProblemsHigherOrderCanonicalLaneLean
end HautevilleHouse