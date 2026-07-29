import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsHigherOrderCanonicalLaneLean

structure RegularityLiftTheorems where
  interiorRegularity : Prop
  boundaryRegularity : Prop
  higherOrderEstimates : Prop
  bootstrapArgument : Prop

structure RegularityLiftTheoremsEvidence (R : RegularityLiftTheorems) where
  interiorRegularityClosed : R.interiorRegularity
  boundaryRegularityClosed : R.boundaryRegularity
  higherOrderEstimatesClosed : R.higherOrderEstimates
  bootstrapArgumentClosed : R.bootstrapArgument

def RegularityLiftTheoremsClosed (R : RegularityLiftTheorems) : Prop :=
  R.interiorRegularity ∧ R.boundaryRegularity ∧ R.higherOrderEstimates ∧ R.bootstrapArgument

theorem regularity_lift_theorems_closed_from_evidence (R : RegularityLiftTheorems)
    (E : RegularityLiftTheoremsEvidence R) : RegularityLiftTheoremsClosed R := by
  exact And.intro E.interiorRegularityClosed
    (And.intro E.boundaryRegularityClosed
      (And.intro E.higherOrderEstimatesClosed E.bootstrapArgumentClosed))

end BoundaryValueProblemsHigherOrderCanonicalLaneLean
end HautevilleHouse
