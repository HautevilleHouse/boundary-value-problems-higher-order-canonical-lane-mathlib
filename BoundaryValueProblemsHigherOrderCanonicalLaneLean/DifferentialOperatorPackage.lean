import canonicalLaneMathlib.AdmissibleClass

/-!
# Differential Operator Package
-/

namespace HautevilleHouse
namespace BoundaryValueProblemsHigherOrder

structure DifferentialOperatorPackage where
  operatorOrder : Nat
  coefficientType : Type u
  ellipticity : Prop
  symbolPrincipal : Type v
  gardingInequality : Prop

structure DifferentialOperatorEvidence (D : DifferentialOperatorPackage) where
  operatorOrderClosed : D.operatorOrder = 4
  ellipticityClosed : D.ellipticity
  gardingInequalityClosed : D.gardingInequality

def DifferentialOperatorClosed (D : DifferentialOperatorPackage) : Prop :=
  D.operatorOrder = 4 ∧ D.ellipticity ∧ D.gardingInequality

theorem differential_operator_closed_from_evidence (D : DifferentialOperatorPackage)
    (E : DifferentialOperatorEvidence D) : DifferentialOperatorClosed D := by
  exact And.intro E.operatorOrderClosed (And.intro E.ellipticityClosed E.gardingInequalityClosed)

end BoundaryValueProblemsHigherOrder
end HautevilleHouse