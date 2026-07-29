import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsHigherOrderCanonicalLaneLean

structure SobolevSpacePackage (k : Nat) (p : ℝ) where
  domain : Type u
  normDefined : Prop
  completeness : Prop
  embeddingTheorems : Prop
  traceOperator : Prop

structure SobolevSpaceEvidence {k : Nat} {p : ℝ} (S : SobolevSpacePackage k p) where
  normDefinedClosed : S.normDefined
  completenessClosed : S.completeness
  embeddingTheoremsClosed : S.embeddingTheorems
  traceOperatorClosed : S.traceOperator

def SobolevSpaceClosed {k : Nat} {p : ℝ} (S : SobolevSpacePackage k p) : Prop :=
  S.normDefined ∧ S.completeness ∧ S.embeddingTheorems ∧ S.traceOperator

theorem sobolev_space_closed_from_evidence
    {k : Nat} {p : ℝ} (S : SobolevSpacePackage k p) (E : SobolevSpaceEvidence S) :
    SobolevSpaceClosed S := by
  exact And.intro E.normDefinedClosed
    (And.intro E.completenessClosed
      (And.intro E.embeddingTheoremsClosed E.traceOperatorClosed))

end BoundaryValueProblemsHigherOrderCanonicalLaneLean
end HautevilleHouse