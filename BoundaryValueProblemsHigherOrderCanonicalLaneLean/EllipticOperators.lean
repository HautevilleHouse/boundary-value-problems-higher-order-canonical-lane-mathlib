import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsHigherOrderCanonicalLaneLean

structure EllipticOperatorPackage (k : ℕ) where
  order : ℕ
  domain : Type u
  symbol : Type v
  uniformEllipticity : Prop
  boundedCoefficients : Prop

structure EllipticOperatorEvidence (E : EllipticOperatorPackage k) where
  uniformEllipticityClosed : E.uniformEllipticity
  boundedCoefficientsClosed : E.boundedCoefficients

def EllipticOperatorClosed (E : EllipticOperatorPackage k) : Prop :=
  E.uniformEllipticity ∧ E.boundedCoefficients

theorem elliptic_operator_closed_from_evidence (E : EllipticOperatorPackage k)
    (Ev : EllipticOperatorEvidence E) : EllipticOperatorClosed E := by
  exact And.intro Ev.uniformEllipticityClosed Ev.boundedCoefficientsClosed

end BoundaryValueProblemsHigherOrderCanonicalLaneLean
end HautevilleHouse