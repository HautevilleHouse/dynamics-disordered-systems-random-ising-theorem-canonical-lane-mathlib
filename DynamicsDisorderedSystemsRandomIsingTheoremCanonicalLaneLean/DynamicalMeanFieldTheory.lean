import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsDisorderedSystemsRandomIsingTheoremCanonicalLaneLean

structure DynamicalMeanFieldTheoryPackage where
  localGreenFunction : ℝ → ℂ
  selfEnergy : ℝ → ℂ
  effectiveMedium : ℝ → ℝ
  spectralFunction : ℝ → ℝ
  bathDiscretization : ℕ

structure DynamicalMeanFieldTheoryEvidence (D : DynamicalMeanFieldTheoryPackage) where
  localGreenFunctionAnalytic : Analytic ℝ ℂ D.localGreenFunction
  selfEnergyAnalytic : Analytic ℝ ℂ D.selfEnergy
  effectiveMediumPositive : ∀ ω, D.effectiveMedium ω > 0
  spectralFunctionNormalized : ∫ ω, D.spectralFunction ω = 1
  bathDiscretizationPositive : D.bathDiscretization > 0

def DynamicalMeanFieldTheoryClosed (D : DynamicalMeanFieldTheoryPackage) : Prop :=
  Analytic ℝ ℂ D.localGreenFunction ∧ Analytic ℝ ℂ D.selfEnergy ∧
  (∀ ω, D.effectiveMedium ω > 0) ∧ (∫ ω, D.spectralFunction ω = 1) ∧ D.bathDiscretization > 0

theorem dynamical_mean_field_theory_closed_from_evidence
    (D : DynamicalMeanFieldTheoryPackage) (E : DynamicalMeanFieldTheoryEvidence D) :
    DynamicalMeanFieldTheoryClosed D := by
  exact And.intro E.localGreenFunctionAnalytic
    (And.intro E.selfEnergyAnalytic
      (And.intro E.effectiveMediumPositive
        (And.intro E.spectralFunctionNormalized E.bathDiscretizationPositive)))

end DynamicsDisorderedSystemsRandomIsingTheoremCanonicalLaneLean
end HautevilleHouse