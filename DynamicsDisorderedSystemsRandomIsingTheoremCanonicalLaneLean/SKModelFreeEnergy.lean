import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsDisorderedSystemsRandomIsingTheoremCanonicalLaneLean

structure SKModelFreeEnergy where
  temperature : ℝ
  externalField : ℝ
  freeEnergyDensity : Prop
  thermodynamicLimit : Prop
  parisiFormula : Prop

structure SKModelFreeEnergyEvidence (F : SKModelFreeEnergy) where
  freeEnergyDensityClosed : F.freeEnergyDensity
  thermodynamicLimitClosed : F.thermodynamicLimit
  parisiFormulaClosed : F.parisiFormula

def SKModelFreeEnergyClosed (F : SKModelFreeEnergy) : Prop :=
  F.freeEnergyDensity ∧ F.thermodynamicLimit ∧ F.parisiFormula

theorem sk_model_free_energy_closed_from_evidence (F : SKModelFreeEnergy)
    (E : SKModelFreeEnergyEvidence F) : SKModelFreeEnergyClosed F := by
  exact And.intro E.freeEnergyDensityClosed
    (And.intro E.thermodynamicLimitClosed E.parisiFormulaClosed)

end DynamicsDisorderedSystemsRandomIsingTheoremCanonicalLaneLean
end HautevilleHouse