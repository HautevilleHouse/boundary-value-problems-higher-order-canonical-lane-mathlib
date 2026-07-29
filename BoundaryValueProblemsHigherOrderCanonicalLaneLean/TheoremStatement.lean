import HautevilleHouse.BoundaryValueProblemsHigherOrderCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace BoundaryValueProblemsHigherOrderCanonicalLaneLean

structure BVPSpace where
  carrier : Type
  topology : TopologicalSpace carrier
  boundary : Type
  boundaryTopology : TopologicalSpace boundary

structure BVPAdmittedObject where
  space : BVPSpace
  domainDimension : Nat
  order : Nat
  linearOperator : String
  boundaryConditions : String
  wellPosed : Prop
  existence : Prop
  uniqueness : Prop
  stability : Prop
  solutionSpace : Type
  conclusion : wellPosed

structure BVPCanonicalClosed (O : BVPAdmittedObject) : Prop where
  existenceClosed : O.existence
  uniquenessClosed : O.uniqueness
  stabilityClosed : O.stability

def BVPCanonicalClosed (O : BVPAdmittedObject) : Prop :=
  O.wellPosed ∧ O.existence ∧ O.uniqueness ∧ O.stability

theorem bvp_canonical_closed_from_evidence (O : BVPAdmittedObject) (E : BVPCanonicalClosed O) : BVPCanonicalClosed O := E

end BoundaryValueProblemsHigherOrderCanonicalLaneLean
end HautevilleHouse