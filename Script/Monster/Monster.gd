@abstract
extends Control
class_name Monster



var hp: int
var dmg: int
var nom: String
var actions: Array[Action] = []
#@onready var interface: Control = $MonsterInterface



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

#éxecuté lorsqu'on passe du nuit au jour	
@abstract func pass_jour() -> void

#éxécuté lorsqu'on passe du jour à la nuit
@abstract func pass_nuit() -> void

#Choisis une action à effectuer
@abstract func takeAction(day:bool) -> Action
