import canonicalLaneMathlib.AdmissibleClass

/-!
# Chaos and Temperature Scaling Package
-/

namespace HautevilleHouse
namespace DynamicsDisorderedSystemsRandomIsingTheoremCanonicalLaneLean

structure ChaosTemperatureScaling (D : DisorderedSpinGlassModel)
    (R : ReplicaTrickPackage D) (S : SelfConsistentEquation D R)
    (Dy : DynamicCriticalExponent D R S) where
  temperatureChaos : Prop
  bondChaos : Prop
  fieldChaos : Prop
  temperatureScalingFunction : Type u
  chaosExponent : Prop
  temperatureScalingDefined : temperatureScalingFunction
  chaosExponentTerm : chaosExponent
  temperatureChaosTerm : temperatureChaos
  bondChaosTerm : bondChaos
  fieldChaosTerm : fieldChaos

structure ChaosTemperatureScalingEvidence (D : DisorderedSpinGlassModel)
    (R : ReplicaTrickPackage D) (S : SelfConsistentEquation D R)
    (Dy : DynamicCriticalExponent D R S)
    (C : ChaosTemperatureScaling D R S Dy) where
  temperatureChaosClosed : C.temperatureChaos
  bondChaosClosed : C.bondChaos
  fieldChaosClosed : C.fieldChaos
  chaosExponentClosed : C.chaosExponent

def ChaosTemperatureScalingClosed (D : DisorderedSpinGlassModel)
    (R : ReplicaTrickPackage D) (S : SelfConsistentEquation D R)
    (Dy : DynamicCriticalExponent D R S)
    (C : ChaosTemperatureScaling D R S Dy) : Prop :=
  C.temperatureChaos ∧ C.bondChaos ∧ C.fieldChaos ∧ C.chaosExponent

theorem chaos_temperature_scaling_closed_from_evidence
    (D : DisorderedSpinGlassModel) (R : ReplicaTrickPackage D)
    (S : SelfConsistentEquation D R) (Dy : DynamicCriticalExponent D R S)
    (C : ChaosTemperatureScaling D R S Dy)
    (E : ChaosTemperatureScalingEvidence D R S Dy C) :
    ChaosTemperatureScalingClosed D R S Dy C := by
  exact And.intro E.temperatureChaosClosed
    (And.intro E.bondChaosClosed
      (And.intro E.fieldChaosClosed E.chaosExponentClosed))

end DynamicsDisorderedSystemsRandomIsingTheoremCanonicalLaneLean
end HautevilleHouse