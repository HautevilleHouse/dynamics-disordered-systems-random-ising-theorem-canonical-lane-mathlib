import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsDisorderedSystemsRandomIsingTheoremCanonicalLaneLean

structure SherringtonKirkpatrickModel where
  nSpins : ℕ
  couplings : ℕ × ℕ → ℝ
  meanField : Prop
  gaussianCouplings : Prop
  frustration : Prop
  parisiSolution : Prop

structure SKModelEvidence (M : SherringtonKirkpatrickModel) where
  meanFieldClosed : M.meanField
  gaussianCouplingsClosed : M.gaussianCouplings
  frustrationClosed : M.frustration

  parisiSolutionClosed : M.parisiSolution

def SherringtonKirkpatrickClosed (M : SherringtonKirkpatrickModel) : Prop :=
  M.meanField ∧ M.gaussianCouplings ∧ M.frustration ∧ M.parisiSolution

theorem sk_model_closed_from_evidence (M : SherringtonKirkpatrickModel) (E : SKModelEvidence M) :
    SherringtonKirkpatrickClosed M := by
  exact And.intro E.meanFieldClosed
    (And.intro E.gaussianCouplingsClosed
      (And.intro E.frustrationClosed E.parisiSolutionClosed))

end DynamicsDisorderedSystemsRandomIsingTheoremCanonicalLaneLean
end HautevilleHouse