import canonicalLaneMathlib.AdmissibleClass

/-!
# Dynamic Critical Exponent Package
-/

namespace HautevilleHouse
namespace DynamicsDisorderedSystemsRandomIsingTheoremCanonicalLaneLean

structure DynamicCriticalExponent (D : DisorderedSpinGlassModel)
    (R : ReplicaTrickPackage D) (S : SelfConsistentEquation D R) where
  glauberDynamics : Prop
  kawasakiDynamics : Prop
  agingScaling : Prop
  criticalExponentZ : Type u
  fluctuationDissipationViolation : Prop
  exponentZDefined : criticalExponentZ
  glauberDynamicsTerm : glauberDynamics
  kawasakiDynamicsTerm : kawasakiDynamics
  agingScalingTerm : agingScaling
  fluctuationDissipationViolationTerm : fluctuationDissipationViolation

structure DynamicCriticalExponentEvidence (D : DisorderedSpinGlassModel)
    (R : ReplicaTrickPackage D) (S : SelfConsistentEquation D R)
    (Dy : DynamicCriticalExponent D R S) where
  glauberDynamicsClosed : Dy.glauberDynamics
  kawasakiDynamicsClosed : Dy.kawasakiDynamics
  agingScalingClosed : Dy.agingScaling
  fluctuationDissipationViolationClosed : Dy.fluctuationDissipationViolation

def DynamicCriticalExponentClosed (D : DisorderedSpinGlassModel)
    (R : ReplicaTrickPackage D) (S : SelfConsistentEquation D R)
    (Dy : DynamicCriticalExponent D R S) : Prop :=
  Dy.glauberDynamics ∧ Dy.kawasakiDynamics ∧ Dy.agingScaling ∧
  Dy.fluctuationDissipationViolation

theorem dynamic_critical_exponent_closed_from_evidence
    (D : DisorderedSpinGlassModel) (R : ReplicaTrickPackage D)
    (S : SelfConsistentEquation D R) (Dy : DynamicCriticalExponent D R S)
    (E : DynamicCriticalExponentEvidence D R S Dy) :
    DynamicCriticalExponentClosed D R S Dy := by
  exact And.intro E.glauberDynamicsClosed
    (And.intro E.kawasakiDynamicsClosed
      (And.intro E.agingScalingClosed E.fluctuationDissipationViolationClosed))

end DynamicsDisorderedSystemsRandomIsingTheoremCanonicalLaneLean
end HautevilleHouse