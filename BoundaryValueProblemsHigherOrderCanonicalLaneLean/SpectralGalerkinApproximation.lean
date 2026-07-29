import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsHigherOrderCanonicalLaneLean

structure SpectralGalerkinApproximation where
  basisConvergence : Prop
  galerkinOrthogonality : Prop
  errorEstimate : Prop
  exponentialConvergence : Prop

structure SpectralGalerkinApproximationEvidence (S : SpectralGalerkinApproximation) where
  basisConvergenceClosed : S.basisConvergence
  galerkinOrthogonalityClosed : S.galerkinOrthogonality
  errorEstimateClosed : S.errorEstimate
  exponentialConvergenceClosed : S.exponentialConvergence

def SpectralGalerkinApproximationClosed (S : SpectralGalerkinApproximation) : Prop :=
  S.basisConvergence ∧ S.galerkinOrthogonality ∧ S.errorEstimate ∧ S.exponentialConvergence

theorem spectral_galerkin_approximation_closed_from_evidence (S : SpectralGalerkinApproximation)
    (E : SpectralGalerkinApproximationEvidence S) : SpectralGalerkinApproximationClosed S := by
  exact And.intro E.basisConvergenceClosed
    (And.intro E.galerkinOrthogonalityClosed
      (And.intro E.errorEstimateClosed E.exponentialConvergenceClosed))

end BoundaryValueProblemsHigherOrderCanonicalLaneLean
end HautevilleHouse
