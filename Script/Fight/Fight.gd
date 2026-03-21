extends Control
class_name Fight

var day: bool = true		#Indique si on est le jour

@onready var player: Player
@onready var FightInterface = $FightInterface
var ennemies: Array[Monster] = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	turn()

func addEnnemy(ennemy: Monster) -> void:
	ennemies.append(ennemy)

##Changement entre jour et nuit
func changeDayNight() -> void:
	day = not day
	for e in ennemies:
		if day:
			e.pass_jour()
		else:
			e.pass_nuit()

##Effectue les effets d'une action
func resolveAction(action: Action) -> void:
	
	#Inflige les dégâts
	action.cible.hp -= action.dmg
	
	#Mets un cooldown sur l'action
	action.turnsBeforeUse = action.cooldown
	
	if action.cible.hp == 0:
		if action.cible == player:
			#Mort du joueur
			pass #à coder
		else:
			#Mort d'un monstre
			ennemies.erase(action.cible)
			
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
	
	#Mise à jour des actions possibles du joueur
	for action in player.actions:
		action.reload(day)
	
	 #Le joueur fait son action
	var playerAction: Action = player.takeAction(ennemies)
	resolveAction(playerAction)
		
		
	#Les ennemis font leurs actions
	for e in ennemies:
		for action in e.actions:
			action.reload(day)
		var eAction: Action = e.takeAction(day)
		resolveAction(eAction)
	
	
	if ennemies.is_empty():
		#S'il n'y a plus d'ennemis, fin du combat et nouveau combat
		_ready()
	else:
		#Sinon on recommence un tour
		turn()
	
