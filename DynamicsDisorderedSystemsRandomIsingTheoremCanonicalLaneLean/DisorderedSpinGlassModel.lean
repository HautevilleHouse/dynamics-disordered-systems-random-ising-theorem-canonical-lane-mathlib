import canonicalLaneMathlib.AdmissibleClass

/-!
# Disordered Spin-Glass Model Package for Random Ising Systems
-/

namespace HautevilleHouse
namespace DynamicsDisorderedSystemsRandomIsingTheoremCanonicalLaneLean

structure DisorderedSpinGlassModel where
  spinLattice : Type u
  spinDimension : Nat
  disorderConfigSpace : Type v
  couplingDistribution : Type w
  randomCouplingRealization : Prop
  spinOperatorAlgebra : Prop
  thermodynamicLimit : Prop
  spinLatticeDimension : Prop
  spinLatticeDimensionTerm : spinLatticeDimension
  disorderConfigSpaceTerm : disorderConfigSpace
  spinOperatorAlgebraTerm : spinOperatorAlgebra
  thermodynamicLimitTerm : thermodynamicLimit

structure DisorderedSpinGlassEvidence (D : DisorderedSpinGlassModel) where
  couplingRealizationClosed : D.randomCouplingRealization
  spinOperatorAlgebraClosed : D.spinOperatorAlgebra
  thermodynamicLimitClosed : D.thermodynamicLimit

def DisorderedSpinGlassClosed (D : DisorderedSpinGlassModel) : Prop :=
  D.randomCouplingRealization ∧ D.spinOperatorAlgebra ∧ D.thermodynamicLimit

theorem disordered_spin_glass_closed_from_evidence (D : DisorderedSpinGlassModel)
    (E : DisorderedSpinGlassEvidence D) : DisorderedSpinGlassClosed D := by
  exact And.intro E.couplingRealizationClosed
    (And.intro E.spinOperatorAlgebraClosed E.thermodynamicLimitClosed)

end DynamicsDisorderedSystemsRandomIsingTheoremCanonicalLaneLean
end HautevilleHouse