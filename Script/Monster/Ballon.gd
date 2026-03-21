extends Monster
class_name Ballon

func _init() -> void:
	hp = 1000
	dmg = 100
	nom = "Ballon"
	var action1 : Action = Action.new(-150, 3, 0, true, Action.Change.NONE)
	action1.cible = Action.Cible.MONSTER
	actions = [action1]
	
func pass_jour() -> void:
	dmg = 100
	
func pass_nuit() -> void:
	dmg=50
	
func takeAction(day:bool) -> Action:
	if actions[0].turnsBeforeUse == 0:
		return actions[0]
	else:
		var action = Action.new(dmg, 0, 0, true, Action.Change.NONE)
		action.cible = Action.Cible.PLAYER
		return action
		
