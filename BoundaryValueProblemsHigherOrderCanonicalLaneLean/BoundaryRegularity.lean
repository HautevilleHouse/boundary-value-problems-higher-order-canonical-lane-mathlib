import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsHigherOrderCanonicalLaneLean

structure BoundaryRegularityPackage where
  operatorOrder : ℕ
  boundarySmoothness : ℕ
  domainRegularity : Prop
  traceTheorem : Prop
  regularityEstimate : Prop

structure BoundaryRegularityEvidence (B : BoundaryRegularityPackage) where
  domainRegularityClosed : B.domainRegularity
  traceTheoremClosed : B.traceTheorem
  regularityEstimateClosed : B.regularityEstimate

def BoundaryRegularityClosed (B : BoundaryRegularityPackage) : Prop :=
  B.domainRegularity ∧ B.traceTheorem ∧ B.regularityEstimate

theorem boundary_regularity_closed_from_evidence (B : BoundaryRegularityPackage)
    (E : BoundaryRegularityEvidence B) : BoundaryRegularityClosed B := by
  exact And.intro E.domainRegularityClosed
    (And.intro E.traceTheoremClosed E.regularityEstimateClosed)

end BoundaryValueProblemsHigherOrderCanonicalLaneLean
end HautevilleHouse