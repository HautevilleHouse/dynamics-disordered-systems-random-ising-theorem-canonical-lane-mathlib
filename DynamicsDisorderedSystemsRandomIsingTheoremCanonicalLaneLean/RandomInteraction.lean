import DynamicsDisorderedSystemsRandomIsingTheoremCanonicalLaneLean.SpinCorrelation

/-!
# Random Interaction Package
-/

namespace HautevilleHouse
namespace DynamicsDisorderedSystemsRandomIsingTheoremCanonicalLaneLean

structure RandomInteractionPackage where
  lattice : Type u
  disorderDistribution : Type v
  couplingStrength : Type w
  finiteVolumeApproximation : Prop
  translationInvariant : Prop

structure RandomInteractionEvidence (R : RandomInteractionPackage) where
  finiteVolumeApproximationClosed : R.finiteVolumeApproximation
  translationInvariantClosed : R.translationInvariant

def RandomInteractionClosed (R : RandomInteractionPackage) : Prop :=
  R.finiteVolumeApproximation ∧ R.translationInvariant

theorem random_interaction_closed_from_evidence
    (R : RandomInteractionPackage) (E : RandomInteractionEvidence R) :
    RandomInteractionClosed R := by
  exact And.intro E.finiteVolumeApproximationClosed E.translationInvariantClosed

end DynamicsDisorderedSystemsRandomIsingTheoremCanonicalLaneLean
end HautevilleHouse