class_name Action

extends Node
enum Change {DAY, NIGHT, NONE}

var dmg: int
var cible: Control
var cooldown: int = 0				#Nombre de tours avant de pouvoir réutiliser l'attaque lorsqu'on l'utilise
var turnsBeforeUse: int = 0			#Nombre de tours actuel à attendre avant de pouvoir réutiliser l'attaque
var stateToReload: bool				#Etat de l'environnement permettant de recharger l'attaque (true = jour)
var change: Change = Change.NONE	#Etat de l'environnement après l'action

func reload(state: bool):
	if turnsBeforeUse>0 and stateToReload == state:
		turnsBeforeUse-=1
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
