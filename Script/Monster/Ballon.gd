extends Monster
class_name Ballon

func _ready() -> void:
	hp = 1000
	dmg = 75
	nom = "Ballon"
	var action1 : Action = Action.new()
	actions = []
