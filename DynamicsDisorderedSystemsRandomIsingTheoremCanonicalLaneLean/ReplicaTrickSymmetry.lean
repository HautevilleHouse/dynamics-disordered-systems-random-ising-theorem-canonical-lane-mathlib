import canonicalLaneMathlib.AdmissibleClass

/-!
# Replica Trick Symmetry Package
-/

namespace HautevilleHouse
namespace DynamicsDisorderedSystemsRandomIsingTheoremCanonicalLaneLean

structure ReplicaTrickPackage (D : DisorderedSpinGlassModel) where
  replicaIndex : Nat
  replicatedPartitionFunction : Prop
  analyticContinuationReplica : Prop
  replicaLimitExistence : Prop
  quenchedDisorderAverage : Prop
  replicaSymmetryBreaking : Prop

structure ReplicaTrickEvidence (D : DisorderedSpinGlassModel)
    (R : ReplicaTrickPackage D) where
  replicatedPartitionFunctionClosed : R.replicatedPartitionFunction
  analyticContinuationReplicaClosed : R.analyticContinuationReplica
  replicaLimitExistenceClosed : R.replicaLimitExistence
  quenchedDisorderAverageClosed : R.quenchedDisorderAverage
  replicaSymmetryBreakingClosed : R.replicaSymmetryBreaking

def ReplicaTrickClosed (D : DisorderedSpinGlassModel)
    (R : ReplicaTrickPackage D) : Prop :=
  R.replicatedPartitionFunction ∧ R.analyticContinuationReplica ∧
  R.replicaLimitExistence ∧ R.quenchedDisorderAverage ∧ R.replicaSymmetryBreaking

theorem replica_trick_closed_from_evidence (D : DisorderedSpinGlassModel)
    (R : ReplicaTrickPackage D) (E : ReplicaTrickEvidence D R) :
    ReplicaTrickClosed D R := by
  exact And.intro E.replicatedPartitionFunctionClosed
    (And.intro E.analyticContinuationReplicaClosed
      (And.intro E.replicaLimitExistenceClosed
        (And.intro E.quenchedDisorderAverageClosed E.replicaSymmetryBreakingClosed)))

end DynamicsDisorderedSystemsRandomIsingTheoremCanonicalLaneLean
end HautevilleHouse