import BoundaryValueProblemsHigherOrderCanonicalLaneLean.WeakFormulation

namespace HautevilleHouse
namespace BoundaryValueProblemsHigherOrderCanonicalLaneLean

structure RegularityPackage {S : SobolevSpacePackage} {O : HigherOrderOperatorPackage S}
    {B : BoundaryConditionsPackage O} {W : WeakFormulationPackage B} where
  interiorRegularity : Prop
  boundaryRegularity : Prop
  gainOfSmoothness : Prop

structure RegularityEvidence {S : SobolevSpacePackage} {O : HigherOrderOperatorPackage S}
    {B : BoundaryConditionsPackage O} {W : WeakFormulationPackage B}
    (R : RegularityPackage W) where
  interiorRegularityClosed : R.interiorRegularity
  boundaryRegularityClosed : R.boundaryRegularity
  gainOfSmoothnessClosed : R.gainOfSmoothness

def RegularityClosed {S : SobolevSpacePackage} {O : HigherOrderOperatorPackage S}
    {B : BoundaryConditionsPackage O} {W : WeakFormulationPackage B}
    (R : RegularityPackage W) : Prop :=
  R.interiorRegularity ∧ R.boundaryRegularity ∧ R.gainOfSmoothness

theorem regularity_closed_from_evidence
    {S : SobolevSpacePackage} {O : HigherOrderOperatorPackage S}
    {B : BoundaryConditionsPackage O} {W : WeakFormulationPackage B}
    (R : RegularityPackage W) (E : RegularityEvidence R) :
    RegularityClosed R := by
  exact And.intro E.interiorRegularityClosed
    (And.intro E.boundaryRegularityClosed E.gainOfSmoothnessClosed)

end BoundaryValueProblemsHigherOrderCanonicalLaneLean
end HautevilleHouse