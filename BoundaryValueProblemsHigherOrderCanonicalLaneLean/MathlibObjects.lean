import BoundaryValueProblemsHigherOrderCanonicalLaneLean.TheoremStatement
import CanonicalLaneMathlibCore
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace BoundaryValueProblemsHigherOrderCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure BVPAdmittedObject where
  domain : Type
  topology : TopologicalSpace domain
  operatorType : Prop
  boundaryCondition : Prop
  solutionSpace : Prop
  conclusion : solutionSpace ∧ boundaryCondition

structure BVPWitnessClosed (O : BVPAdmittedObject) : Prop :=
  spaceClosed : O.solutionSpace
  boundaryClosed : O.boundaryCondition

end BoundaryValueProblemsHigherOrderCanonicalLaneLean
end HautevilleHouse