import BoundaryValueProblemsHigherOrderCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsHigherOrderCanonicalLaneLean

structure DifferentialOperator (S : BVPSpace) where
  order : Nat
  coefficients : List (S.domain → ℝ)  -- placeholder for coefficient functions
  isLinear : Prop
  isElliptic : Prop
  symbolDefined : Prop
  symbolEllipticity : Prop

structure DifferentialOperatorEvidence {S : BVPSpace} (L : DifferentialOperator S) where
  linearityClosed : L.isLinear
  ellipticityClosed : L.isElliptic
  symbolClosed : L.symbolDefined
  symbolEllipticityClosed : L.symbolEllipticity

def DifferentialOperatorClosed {S : BVPSpace} (L : DifferentialOperator S) : Prop :=
  L.isLinear ∧ L.isElliptic ∧ L.symbolDefined ∧ L.symbolEllipticity

theorem differential_operator_closed_from_evidence {S : BVPSpace} (L : DifferentialOperator S) (E : DifferentialOperatorEvidence L) : DifferentialOperatorClosed L := by
  exact And.intro E.linearityClosed (And.intro E.ellipticityClosed (And.intro E.symbolClosed E.symbolEllipticityClosed))

end BoundaryValueProblemsHigherOrderCanonicalLaneLean
end HautevilleHouse