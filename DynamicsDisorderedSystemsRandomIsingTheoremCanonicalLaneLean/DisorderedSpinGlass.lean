import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsDisorderedSystemsRandomIsingTheoremCanonicalLaneLean

structure RandomCouplingDistribution where
  mean : ℝ
  variance : ℝ
  finiteFourthMoment : Prop
  symmetricAboutZero : Prop

structure DisorderedSpinGlass where
  lattice : Type u
  spinSpace : Type v
  couplingDistribution : RandomCouplingDistribution
  hamiltonian : (Type u → Type v) → ℝ
  quenchedDisorder : Prop
  magnetizationParameter : Prop

structure SpinGlassEvidence (G : DisorderedSpinGlass) where
  quenchedDisorderClosed : G.quenchedDisorder
  magnetizationParameterClosed : G.magnetizationParameter

def DisorderedSpinGlassClosed (G : DisorderedSpinGlass) : Prop :=
  G.quenchedDisorder ∧ G.magnetizationParameter

theorem disordered_spin_glass_closed_from_evidence (G : DisorderedSpinGlass) (E : SpinGlassEvidence G) :
    DisorderedSpinGlassClosed G := by
  exact And.intro E.quenchedDisorderClosed E.magnetizationParameterClosed

end DynamicsDisorderedSystemsRandomIsingTheoremCanonicalLaneLean
end HautevilleHouse