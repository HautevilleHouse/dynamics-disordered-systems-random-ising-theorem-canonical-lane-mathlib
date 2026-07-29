import DynamicsDisorderedSystemsRandomIsingTheoremCanonicalLaneLean.TheoremStatement
import CanonicalLaneMathlibCore

namespace HautevilleHouse
namespace DynamicsDisorderedSystemsRandomIsingTheoremCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure RandomIsingSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure RandomIsingAdmittedObject where
  space : RandomIsingSpace
  finiteSystem : Prop
  spinConfigurationSet : Prop
  disorderDistribution : Type
  disjointPhase : Prop
  conclusion : disjointPhase

structure RandomIsingEndgameState where
  object : RandomIsingAdmittedObject

def RandomIsingWitnessClosed (O : RandomIsingAdmittedObject) : Prop :=
  O.disjointPhase

end DynamicsDisorderedSystemsRandomIsingTheoremCanonicalLaneLean
end HautevilleHouse