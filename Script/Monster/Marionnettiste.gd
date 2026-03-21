extends Monster
class_name Marionnettiste

var state = false 	#Etat du marionnettiste (jour=true ; nuit=false)

func _init() -> void:
	hp = 1000
	dmg = 75
	nom = "Marionnettiste"
	var actionNuit1: Action = Action.new(225, 2, 0, false, Action.Change.NONE, Action.Effect.DMG)
	actionNuit1.cible = Action.Cible.PLAYER
	var actionNuit2: Action = Action.new(100, 2, 2, true, Action.Change.NONE, Action.Effect.DMG)
	actionNuit2.cible = Action.Cible.PLAYER
	var actionJour1: Action = Action.new(-150, 3, 0, true, Action.Change.NONE, Action.Effect.DMG)
	actionJour1.cible = Action.Cible.MONSTER
	var actionJour2: Action = Action.new(150, 2, 2, false, Action.Change.NONE, Action.Effect.DMG)
	actionJour2.cible = Action.Cible.PLAYER
	actions = [actionNuit1, actionNuit2, actionJour1, actionJour2]
	
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
	
func takeAction(day:bool) -> Action:
	#En mode jour
	if state:
		#Action de changement d'état
		if actions[3].turnsBeforeUse==0 and not day:
			state=false
			dmg = 150
			return actions[3]
		#Autre action
		elif actions[2].turnsBeforeUse==0:
			return actions[2]
		#Attaque de base
		else:
			var action = Action.new(dmg, 0, 0, true, Action.Change.NONE, Action.Effect.DMG)
			action.cible=Action.Cible.PLAYER
			return action
			
	#En mode nuit
	else:
		#Action de changement d'état
		if actions[1].turnsBeforeUse==0 and day:
			state=true
			dmg = 100
			return actions[1]
		#Autre action
		elif actions[0].turnsBeforeUse==0:
			return actions[0]
		#Attaque de base
		else:
			var action = Action.new(dmg, 0, 0, true, Action.Change.NONE, Action.Effect.DMG)
			action.cible=Action.Cible.PLAYER
			return action
