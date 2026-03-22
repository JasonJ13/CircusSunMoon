extends Monster
class_name NightMonster

func _init() -> void:
	hp_max = 1000
	hp = 1000
	dmg = 75
	nom = "NightMonster"
	var action1: Action = Action.new(225, 3, 0, false, Action.Change.NONE, Action.Effect.DMG)
	action1.cible = Action.Cible.PLAYER
	actions = [action1]
	
func _ready() -> void :
	animation = $Control/Animation
	dmgAnimation = $Control/DmgAnimation
	dmgLabel =$Control/DmgTaken
	
func pass_jour() -> void:
	dmg=75

func pass_nuit() -> void:
	dmg=150
	
func takeAction(day:bool) -> Action:
	if actions[0].turnsBeforeUse <= 0:
		return actions[0]
	else:
		var action = Action.new(dmg, 0, 0, true, Action.Change.NONE, Action.Effect.DMG)
		action.cible=Action.Cible.PLAYER
		return action
