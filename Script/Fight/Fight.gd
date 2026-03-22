extends Control
class_name Fight

var day: bool = true		#Indique si on est le jour

@onready var interface = $FightInterface
@export var player: Player
@export var ennemie: Monster



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	turn()


##Changement entre jour et nuit
func changeDayNight() -> void:
	day = not day

	if day:
		interface.night_to_day()
		ennemie.pass_jour()
	else:
		interface.day_to_night()
		ennemie.pass_nuit()

##Effectue les effets d'une action
func resolveAction(action: Action) -> void:
	
	#Mets un cooldown sur l'action
	action.turnsBeforeUse = action.cooldown
	
	#Inflige les dégâts
	match action.cible :
		Action.Cible.PLAYER :
			player.hp -= floor(action.dmg * player.dmgReceiveModifier)
			
			if player.hp < 1 :
				pass
				#Mort du joueur
	
		Action.Cible.MONSTER :
			if action.dmg > 0:
				ennemie.hp -= floor(action.dmg * player.dmgInflictModifier)
			else:
				if ennemie.hp - action.dmg > ennemie.hp_max:
					ennemie.hp = 1000
				else:
					ennemie.hp -= action.dmg
			
	#Regarde si l'action change le cycle
	match action.change :
		Action.Change.DAY:
			if not day:
				changeDayNight()
		Action.Change.NIGHT:
			if day:
				changeDayNight()

#Un tour : joueur + ennemis
func turn() -> void:
	
	if ennemie.hp < 1 :
		#S'il n'y a plus d'ennemis, fin du combat et nouveau combat
		print("bravo")
		ennemie.queue_free()
		return

	
	#Mise à jour des actions possibles du joueur
	for action in player.actions:
		action.reload(day)
	
	 #Le joueur fait son action
	var playerAction: Action = await player.takeAction(ennemie, day)
	resolveAction(playerAction)

	#Les ennemis font leurs actions
	for action in ennemie.actions:
		action.reload(day)

	var eAction = await ennemie.your_turn(day)
	resolveAction(eAction)
	
	print(player.hp)
	print(ennemie.hp)
	

	turn()
	
