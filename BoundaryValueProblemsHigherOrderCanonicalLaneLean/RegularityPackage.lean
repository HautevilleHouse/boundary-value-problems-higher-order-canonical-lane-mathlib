import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsHigherOrderCanonicalLaneLean

structure RegularityPackage {n : Nat} (B : BoundaryValueProblemPackage n) where
  interiorRegularity : Prop
  boundaryRegularity : Prop
  schauderEstimates : Prop
  higherOrderSobolevRegularity : Prop

structure RegularityEvidence {n : Nat} {B : BoundaryValueProblemPackage n} (R : RegularityPackage B) where
  interiorRegularityClosed : R.interiorRegularity
  boundaryRegularityClosed : R.boundaryRegularity
  schauderEstimatesClosed : R.schauderEstimates
  higherOrderSobolevRegularityClosed : R.higherOrderSobolevRegularity

def RegularityClosed {n : Nat} {B : BoundaryValueProblemPackage n} (R : RegularityPackage B) : Prop :=
  R.interiorRegularity ∧ R.boundaryRegularity ∧ R.schauderEstimates ∧ R.higherOrderSobolevRegularity

theorem regularity_closed_from_evidence
    {n : Nat} {B : BoundaryValueProblemPackage n} (R : RegularityPackage B)
    (E : RegularityEvidence R) : RegularityClosed R := by
  exact And.intro E.interiorRegularityClosed
    (And.intro E.boundaryRegularityClosed
      (And.intro E.schauderEstimatesClosed E.higherOrderSobolevRegularityClosed))

end BoundaryValueProblemsHigherOrderCanonicalLaneLean
end HautevilleHouse