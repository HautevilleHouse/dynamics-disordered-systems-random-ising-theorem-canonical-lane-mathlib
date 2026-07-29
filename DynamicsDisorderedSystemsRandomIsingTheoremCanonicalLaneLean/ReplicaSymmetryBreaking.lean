import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsDisorderedSystemsRandomIsingTheoremCanonicalLaneLean

structure ReplicaSymmetryBreaking where
  overlapMatrix : ℕ × ℕ → ℝ
  hierarchicalStructure : Prop
  ultrametricProperty : Prop
  infiniteReplicaLimit : Prop
  parisiOrderParameter : Prop

structure RSBEvidence (R : ReplicaSymmetryBreaking) where
  hierarchicalStructureClosed : R.hierarchicalStructure
  ultrametricPropertyClosed : R.ultrametricProperty
  infiniteReplicaLimitClosed : R.infiniteReplicaLimit
  parisiOrderParameterClosed : R.parisiOrderParameter

def ReplicaSymmetryBreakingClosed (R : ReplicaSymmetryBreaking) : Prop :=
  R.hierarchicalStructure ∧ R.ultrametricProperty ∧
  R.infiniteReplicaLimit ∧ R.parisiOrderParameter

theorem rsb_closed_from_evidence (R : ReplicaSymmetryBreaking) (E : RSBEvidence R) :
    ReplicaSymmetryBreakingClosed R := by
  exact And.intro E.hierarchicalStructureClosed
    (And.intro E.ultrametricPropertyClosed
      (And.intro E.infiniteReplicaLimitClosed E.parisiOrderParameterClosed))

end DynamicsDisorderedSystemsRandomIsingTheoremCanonicalLaneLean
end HautevilleHouse