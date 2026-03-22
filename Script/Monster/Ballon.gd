extends Monster
class_name Ballon




func _init() -> void:
	hp_max = 1000
	hp = hp_max
	dmg = 100
	nom = "Ballon"
	var action1 : Action = Action.new(-150, 3, 0, true, Action.Change.NONE,Action.Effect.DMG)
	action1.cible = Action.Cible.MONSTER
	actions = [action1]

func _ready() -> void :
	animation = $Control/Animation
	monsterAnimation = $BallonAnimation

func pass_jour() -> void:
	dmg = 100
	
func pass_nuit() -> void:
	dmg=50


@warning_ignore("unused_parameter")
func takeAction(day:bool) -> Action:
	if actions[0].turnsBeforeUse <= 0 and hp != hp_max:
		return actions[0]
	else:
		var action = Action.new(dmg, 0, 0, true, Action.Change.NONE,Action.Effect.DMG)
		action.cible = Action.Cible.PLAYER
		return action
