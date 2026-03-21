extends Control

var hp: int = 100
var playerTurn: bool = false
var decision: Action
@onready var interface: Control = $PlayerInterface
const hpmax: int = 100

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
