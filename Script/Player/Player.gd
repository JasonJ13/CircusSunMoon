extends Control
class_name Player

var hp: int = 100
var playerTurn: bool = false
@onready var interface: Control = $PlayerInterface
const hpmax: int = 100
var actions: Array[Action] = [] #Toutes les actions possibles

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#à faire: initialiser les actions
	pass
		
func takeAction(ennemies: Array[Monster]) -> Action:
	#à faire: Envoyer les ennemies, les pvs du joueur et ses actions à PlayerInterface
	return null
