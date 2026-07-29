import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsDisorderedSystemsRandomIsingTheoremCanonicalLaneLean

structure LangevinDynamics where
  timeParameter : Type u
  spinConfiguration : Type v
  stochasticEquation : Prop
  equilibriumDistribution : Prop
  correlationFunction : Prop

structure LangevinDynamicsEvidence (L : LangevinDynamics) where
  stochasticEquationClosed : L.stochasticEquation
  equilibriumDistributionClosed : L.equilibriumDistribution
  correlationFunctionClosed : L.correlationFunction

def LangevinDynamicsClosed (L : LangevinDynamics) : Prop :=
  L.stochasticEquation ∧ L.equilibriumDistribution ∧ L.correlationFunction

theorem langevin_dynamics_closed_from_evidence (L : LangevinDynamics)
    (E : LangevinDynamicsEvidence L) : LangevinDynamicsClosed L := by
  exact And.intro E.stochasticEquationClosed
    (And.intro E.equilibriumDistributionClosed E.correlationFunctionClosed)

end DynamicsDisorderedSystemsRandomIsingTheoremCanonicalLaneLean
end HautevilleHouse