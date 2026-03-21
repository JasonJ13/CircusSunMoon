extends Control
class_name Fight

var day: bool = true		#Indique si on est le jour

@onready var player: Player
@onready var FightInterface = $FightInterface
var ennemies: Array[Monster]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

#Changement entre jour et nuit
func changeDayNight() -> void:
	day = not day
	for e in ennemies:
		if day:
			e.pass_jour()
		else:
			e.pass_nuit()

#Effectue les effets d'une action
func resolveAction(action: Action) -> void:
	
	#Inflige les dégâts
	action.cible.hp -= action.dmg
	
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
	 #Le joueur fait son action
	var playerAction: Action = player.takeAction()
	resolveAction(playerAction)
		
		
	#Les ennemis font leurs actions
	for e in ennemies:
		var eAction: Action = e.takeAction()
		resolveAction(eAction)
