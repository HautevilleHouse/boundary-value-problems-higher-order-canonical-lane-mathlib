import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsHigherOrderCanonicalLaneLean

structure WeakSolutionWellPosedness where
  bilinearFormCoercive : Prop
  linearFormBounded : Prop
  laxMilgramApplied : Prop
  uniqueSolvability : Prop

structure WeakSolutionWellPosednessEvidence (W : WeakSolutionWellPosedness) where
  bilinearFormCoerciveClosed : W.bilinearFormCoercive
  linearFormBoundedClosed : W.linearFormBounded
  laxMilgramAppliedClosed : W.laxMilgramApplied
  uniqueSolvabilityClosed : W.uniqueSolvability

def WeakSolutionWellPosednessClosed (W : WeakSolutionWellPosedness) : Prop :=
  W.bilinearFormCoercive ∧ W.linearFormBounded ∧ W.laxMilgramApplied ∧ W.uniqueSolvability

theorem weak_solution_well_posedness_closed_from_evidence (W : WeakSolutionWellPosedness)
    (E : WeakSolutionWellPosednessEvidence W) : WeakSolutionWellPosednessClosed W := by
  exact And.intro E.bilinearFormCoerciveClosed
    (And.intro E.linearFormBoundedClosed
      (And.intro E.laxMilgramAppliedClosed E.uniqueSolvabilityClosed))

end BoundaryValueProblemsHigherOrderCanonicalLaneLean
end HautevilleHouse
