import canonicalLaneMathlib.AdmissibleClass

/-!
# Self-Consistent Equation Package (Mean-Field Solution)
-/

namespace HautevilleHouse
namespace DynamicsDisorderedSystemsRandomIsingTheoremCanonicalLaneLean

structure SelfConsistentEquation (D : DisorderedSpinGlassModel)
    (R : ReplicaTrickPackage D) where
  orderParameter : Type u
  magnetisationEquation : Prop
  overlapParameter : Prop
  sherringtonKirkpatrickSolution : Prop
  deAlmeidaThoulessLine : Prop
  orderParameterDefined : orderParameter
  overlapParameterTerm : overlapParameter
  skSolutionTerm : sherringtonKirkpatrickSolution
  atLineTerm : deAlmeidaThoulessLine

structure SelfConsistentEvidence (D : DisorderedSpinGlassModel)
    (R : ReplicaTrickPackage D) (S : SelfConsistentEquation D R) where
  magnetisationEquationClosed : S.magnetisationEquation
  overlapParameterClosed : S.overlapParameter
  sherringtonKirkpatrickSolutionClosed : S.sherringtonKirkpatrickSolution
  deAlmeidaThoulessLineClosed : S.deAlmeidaThoulessLine

def SelfConsistentClosed (D : DisorderedSpinGlassModel)
    (R : ReplicaTrickPackage D) (S : SelfConsistentEquation D R) : Prop :=
  S.magnetisationEquation ∧ S.overlapParameter ∧
  S.sherringtonKirkpatrickSolution ∧ S.deAlmeidaThoulessLine

theorem self_consistent_closed_from_evidence (D : DisorderedSpinGlassModel)
    (R : ReplicaTrickPackage D) (S : SelfConsistentEquation D R)
    (E : SelfConsistentEvidence D R S) : SelfConsistentClosed D R S := by
  exact And.intro E.magnetisationEquationClosed
    (And.intro E.overlapParameterClosed
      (And.intro E.sherringtonKirkpatrickSolutionClosed
        E.deAlmeidaThoulessLineClosed))

end DynamicsDisorderedSystemsRandomIsingTheoremCanonicalLaneLean
end HautevilleHouse