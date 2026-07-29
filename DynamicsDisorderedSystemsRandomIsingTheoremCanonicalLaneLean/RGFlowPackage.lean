import DynamicsDisorderedSystemsRandomIsingTheoremCanonicalLaneLean.RandomInteraction

/-!
# RG Flow Package
-/

namespace HautevilleHouse
namespace DynamicsDisorderedSystemsRandomIsingTheoremCanonicalLaneLean

structure RGFlowPackage {R : RandomInteractionPackage} where
  rgTransformation : Type u
  fixedPointExistence : Prop
  basinOfAttraction : Prop
  criticalSurfaceDimension : Prop

structure RGFlowEvidence {R : RandomInteractionPackage} (F : RGFlowPackage R) where
  fixedPointExistenceClosed : F.fixedPointExistence
  basinOfAttractionClosed : F.basinOfAttraction
  criticalSurfaceDimensionClosed : F.criticalSurfaceDimension

def RGFlowClosed {R : RandomInteractionPackage} (F : RGFlowPackage R) : Prop :=
  F.fixedPointExistence ∧ F.basinOfAttraction ∧ F.criticalSurfaceDimension

theorem rg_flow_closed_from_evidence
    {R : RandomInteractionPackage} (F : RGFlowPackage R) (E : RGFlowEvidence F) :
    RGFlowClosed F := by
  exact And.intro E.fixedPointExistenceClosed
    (And.intro E.basinOfAttractionClosed E.criticalSurfaceDimensionClosed)

end DynamicsDisorderedSystemsRandomIsingTheoremCanonicalLaneLean
end HautevilleHouse