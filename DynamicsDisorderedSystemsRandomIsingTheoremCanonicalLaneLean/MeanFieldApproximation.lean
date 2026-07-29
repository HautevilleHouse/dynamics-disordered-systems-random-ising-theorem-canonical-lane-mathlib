import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsDisorderedSystemsRandomIsingTheoremCanonicalLaneLean

structure MeanFieldApproximation where
  orderParameter : Type u
  selfConsistencyEquation : Prop
  criticalTemperature : Prop
  phaseTransition : Prop

structure MeanFieldApproximationEvidence (M : MeanFieldApproximation) where
  selfConsistencyEquationClosed : M.selfConsistencyEquation
  criticalTemperatureClosed : M.criticalTemperature
  phaseTransitionClosed : M.phaseTransition

def MeanFieldApproximationClosed (M : MeanFieldApproximation) : Prop :=
  M.selfConsistencyEquation ∧ M.criticalTemperature ∧ M.phaseTransition

theorem mean_field_approximation_closed_from_evidence (M : MeanFieldApproximation)
    (E : MeanFieldApproximationEvidence M) : MeanFieldApproximationClosed M := by
  exact And.intro E.selfConsistencyEquationClosed
    (And.intro E.criticalTemperatureClosed E.phaseTransitionClosed)

end DynamicsDisorderedSystemsRandomIsingTheoremCanonicalLaneLean
end HautevilleHouse