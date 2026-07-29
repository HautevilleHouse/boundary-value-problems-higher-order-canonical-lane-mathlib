import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsHigherOrderCanonicalLaneLean

structure BoundaryConditionPackage (n : Nat) where
  domainType : Type u
  boundaryOperator : Type v
  differentialOrder : Nat
  regularity : Prop
  coercivity : Prop

def BoundaryConditionClosed {n : Nat} (B : BoundaryConditionPackage n) : Prop :=
  B.coercivity

end BoundaryValueProblemsHigherOrderCanonicalLaneLean
end HautevilleHouse
