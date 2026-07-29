import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsHigherOrderCanonicalLaneLean

structure SobolevSpaceEmbeddings where
  sobolevInequality : Prop
  morreyEstimate : Prop
  compactEmbedding : Prop
  traceEmbedding : Prop

structure SobolevSpaceEmbeddingsEvidence (S : SobolevSpaceEmbeddings) where
  sobolevInequalityClosed : S.sobolevInequality
  morreyEstimateClosed : S.morreyEstimate
  compactEmbeddingClosed : S.compactEmbedding
  traceEmbeddingClosed : S.traceEmbedding

def SobolevSpaceEmbeddingsClosed (S : SobolevSpaceEmbeddings) : Prop :=
  S.sobolevInequality ∧ S.morreyEstimate ∧ S.compactEmbedding ∧ S.traceEmbedding

theorem sobolev_space_embeddings_closed_from_evidence (S : SobolevSpaceEmbeddings)
    (E : SobolevSpaceEmbeddingsEvidence S) : SobolevSpaceEmbeddingsClosed S := by
  exact And.intro E.sobolevInequalityClosed
    (And.intro E.morreyEstimateClosed
      (And.intro E.compactEmbeddingClosed E.traceEmbeddingClosed))

end BoundaryValueProblemsHigherOrderCanonicalLaneLean
end HautevilleHouse
