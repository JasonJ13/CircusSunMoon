extends Monster
class_name Marionnettiste

var state: bool = false 	#Etat du marionnettiste (jour=true ; nuit=false)
var actionsDay: Array[Action]	#Sorts utilisables quand le marionnettiste est dans l'état jour
var actionsNight: Array[Action] #Sorts utilisables quand le marionnettiste est dans l'état jour

func _init() -> void:
	hp = 1000
	dmg = 75
	nom = "Marionnettiste"
	var actionNight1: Action = Action.new(250, 2, 0, false, Action.Change.NONE, Action.Effect.DMG)
	actionNight1.cible = Action.Cible.PLAYER
	var actionNight2: Action = Action.new(100, 2, 2, true, Action.Change.NONE, Action.Effect.DMG)
	actionNight2.cible = Action.Cible.PLAYER
	actionsNight = [actionNight1, actionNight2]
	var actionDay1: Action = Action.new(-200, 3, 0, true, Action.Change.NONE, Action.Effect.DMG)
	actionDay1.cible = Action.Cible.MONSTER
	var actionDay2: Action = Action.new(150, 2, 2, false, Action.Change.NONE, Action.Effect.DMG)
	actionDay2.cible = Action.Cible.PLAYER
	actionsDay = [actionDay1, actionDay2]
	actions = actionsNight
	
func pass_jour() -> void:
	if state:
		dmg=100
	else:
		dmg=75

func pass_nuit() -> void:
	if state:
		dmg=50
	else:
		dmg=150
	
func takeAction(isday:bool) -> Action:
	#action de changement d'état
	if actions[1].turnsBeforeUse <= 0 and state!=isday:
		state = not state
		if state:
			dmg = 100
			actions = actionsDay
			return actionsNight[1]
		else:
			dmg = 150
			actions = actionsNight
			return actionsDay[1]
	#autre action
	elif actions[0].turnsBeforeUse <= 0:
		return actions[0]
	#attaque de base
	else:
		var action = Action.new(dmg, 0, 0, true, Action.Change.NONE, Action.Effect.DMG)
		action.cible=Action.Cible.PLAYER
		return action
