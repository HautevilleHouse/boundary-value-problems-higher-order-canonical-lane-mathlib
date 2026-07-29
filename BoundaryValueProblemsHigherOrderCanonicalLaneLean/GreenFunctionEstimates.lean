import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsHigherOrderCanonicalLaneLean

structure GreenFunctionEstimates where
  domainRegularity : Prop
  kernelBounds : Prop
  derivativeBounds : Prop
  schauderEstimate : Prop

structure GreenFunctionEstimatesEvidence (G : GreenFunctionEstimates) where
  domainRegularityClosed : G.domainRegularity
  kernelBoundsClosed : G.kernelBounds
  derivativeBoundsClosed : G.derivativeBounds
  schauderEstimateClosed : G.schauderEstimate

def GreenFunctionEstimatesClosed (G : GreenFunctionEstimates) : Prop :=
  G.domainRegularity ∧ G.kernelBounds ∧ G.derivativeBounds ∧ G.schauderEstimate

theorem green_function_estimates_closed_from_evidence (G : GreenFunctionEstimates)
    (E : GreenFunctionEstimatesEvidence G) : GreenFunctionEstimatesClosed G := by
  exact And.intro E.domainRegularityClosed
    (And.intro E.kernelBoundsClosed
      (And.intro E.derivativeBoundsClosed E.schauderEstimateClosed))

end BoundaryValueProblemsHigherOrderCanonicalLaneLean
end HautevilleHouse
