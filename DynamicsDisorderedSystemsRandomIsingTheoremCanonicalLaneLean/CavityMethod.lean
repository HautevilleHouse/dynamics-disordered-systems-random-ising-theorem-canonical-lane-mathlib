import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsDisorderedSystemsRandomIsingTheoremCanonicalLaneLean

structure CavityMethod where
  cavityField : Type u
  recursionRelation : Prop
  fixedPointEquation : Prop
  magnetizationComputation : Prop

structure CavityMethodEvidence (C : CavityMethod) where
  recursionRelationClosed : C.recursionRelation
  fixedPointEquationClosed : C.fixedPointEquation
  magnetizationComputationClosed : C.magnetizationComputation

def CavityMethodClosed (C : CavityMethod) : Prop :=
  C.recursionRelation ∧ C.fixedPointEquation ∧ C.magnetizationComputation

theorem cavity_method_closed_from_evidence (C : CavityMethod)
    (E : CavityMethodEvidence C) : CavityMethodClosed C := by
  exact And.intro E.recursionRelationClosed
    (And.intro E.fixedPointEquationClosed E.magnetizationComputationClosed)

end DynamicsDisorderedSystemsRandomIsingTheoremCanonicalLaneLean
end HautevilleHouse