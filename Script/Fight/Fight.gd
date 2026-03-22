extends Control
class_name Fight

var day: bool = true		#Indique si on est le jour

@onready var interface = $FightInterface
@export var player: Player
var ennemie: Monster = null
@onready var allEnnemies : Array[Resource] = [load("res://Scene/Monster/Ballon.tscn"), load("res://Scene/Monster/BallonNight.tscn"), load("res://Scene/Monster/Marionnettiste.tscn")] 
var indEnnemy: int = 0
@export var nmb_vague_tot = 3

signal toNight
signal toDay

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	new_wave()
	turn()


func new_wave() -> bool:
	
	if ennemie != null :
		ennemie.queue_free()
	
	if indEnnemy == nmb_vague_tot :
		return true
		
	else :
		
		
		ennemie = allEnnemies[indEnnemy].instantiate()
		add_child(ennemie)
		ennemie.position = Vector2(764,247)
		
		indEnnemy += 1
		return false

##Changement entre jour et nuit
func changeDayNight() -> void:
	day = not day

	if day:
		interface.night_to_day()
		ennemie.pass_jour()
		toDay.emit()
	else:
		interface.day_to_night()
		ennemie.pass_nuit()
		toNight.emit()

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
			await ennemie.take_dmg(floor(action.dmg * player.dmgInflictModifier))
			
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
	var playerAction: Action = await player.takeAction(ennemie, day)
	await resolveAction(playerAction)
	if ennemie.hp < 1 :
		#Si l'ennemie meurt, nouveau combat
		var terminer : bool = new_wave()
		if terminer:
			print("bravo")
		else :
			player.hp = player.hpmax
			turn()
		return

	#Les ennemis font leurs actions
	for action in ennemie.actions:
		action.reload(day)

	var eAction = await ennemie.your_turn(day)
	await resolveAction(eAction)
	
	turn()
	
