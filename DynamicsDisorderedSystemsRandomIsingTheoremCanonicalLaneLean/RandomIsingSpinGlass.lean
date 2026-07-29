import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsDisorderedSystemsRandomIsingTheoremCanonicalLaneLean

structure RandomIsingSpinGlass where
  lattice : Type u
  spins : lattice → Type v
  couplingDistribution : Prop
  disorderRealization : Prop
  partitionFunction : Prop

structure RandomIsingSpinGlassEvidence (G : RandomIsingSpinGlass) where
  couplingDistributionClosed : G.couplingDistribution
  disorderRealizationClosed : G.disorderRealization
  partitionFunctionClosed : G.partitionFunction

def RandomIsingSpinGlassClosed (G : RandomIsingSpinGlass) : Prop :=
  G.couplingDistribution ∧ G.disorderRealization ∧ G.partitionFunction

theorem random_ising_spin_glass_closed_from_evidence (G : RandomIsingSpinGlass)
    (E : RandomIsingSpinGlassEvidence G) : RandomIsingSpinGlassClosed G := by
  exact And.intro E.couplingDistributionClosed
    (And.intro E.disorderRealizationClosed E.partitionFunctionClosed)

end DynamicsDisorderedSystemsRandomIsingTheoremCanonicalLaneLean
end HautevilleHouse