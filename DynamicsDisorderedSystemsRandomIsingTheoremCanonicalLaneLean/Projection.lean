import DynamicsDisorderedSystemsRandomIsingTheoremCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsDisorderedSystemsRandomIsingTheoremCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

def randomIsingProjection : Projection RandomIsingEndgameState := {
  toFun := fun x => x,
  idempotent := by intro x; rfl
}

theorem random_ising_projection_idempotent (x : RandomIsingEndgameState) :
    randomIsingProjection.toFun (randomIsingProjection.toFun x) = randomIsingProjection.toFun x := by
  exact randomIsingProjection.idempotent x

end DynamicsDisorderedSystemsRandomIsingTheoremCanonicalLaneLean
end HautevilleHouse