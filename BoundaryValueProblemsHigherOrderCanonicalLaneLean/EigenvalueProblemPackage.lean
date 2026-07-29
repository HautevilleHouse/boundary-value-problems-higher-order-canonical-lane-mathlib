import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsHigherOrderCanonicalLaneLean

structure EigenvalueProblemPackage {n : Nat} (B : BoundaryValueProblemPackage n) where
  compactInverse : Prop
  discreteSpectrum : Prop
  eigenfunctionExpansion : Prop
  variationalCharacterization : Prop

structure EigenvalueProblemEvidence {n : Nat} {B : BoundaryValueProblemPackage n} (E : EigenvalueProblemPackage B) where
  compactInverseClosed : E.compactInverse
  discreteSpectrumClosed : E.discreteSpectrum
  eigenfunctionExpansionClosed : E.eigenfunctionExpansion
  variationalCharacterizationClosed : E.variationalCharacterization

def EigenvalueProblemClosed {n : Nat} {B : BoundaryValueProblemPackage n} (E : EigenvalueProblemPackage B) : Prop :=
  E.compactInverse ∧ E.discreteSpectrum ∧ E.eigenfunctionExpansion ∧ E.variationalCharacterization

theorem eigenvalue_problem_closed_from_evidence
    {n : Nat} {B : BoundaryValueProblemPackage n} (Epkg : EigenvalueProblemPackage B)
    (E : EigenvalueProblemEvidence Epkg) : EigenvalueProblemClosed Epkg := by
  exact And.intro E.compactInverseClosed
    (And.intro E.discreteSpectrumClosed
      (And.intro E.eigenfunctionExpansionClosed E.variationalCharacterizationClosed))

end BoundaryValueProblemsHigherOrderCanonicalLaneLean
end HautevilleHouse