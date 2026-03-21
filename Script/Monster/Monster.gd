extends Control
class_name Monster
var hp: int
var dmg: int
@onready var interface: Control = $MonsterInterface

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

#éxecuté lorsqu'on passe du nuit au jour	
func pass_jour() -> void:
	pass

#éxécuté lorsqu'on passe du jour à la nuit
func pass_nuit() -> void:
	pass

#Choisis une action à effectuer
func takeAction() -> Action:
	return null
