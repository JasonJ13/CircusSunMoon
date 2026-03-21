class_name Action

extends Node
enum Change {DAY, NIGHT, NONE}

var dmg: int
var cible: Control
var cooldown: int = 0
var change: Change = Change.NONE

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
