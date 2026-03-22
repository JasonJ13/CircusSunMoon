extends Node
@onready var M: Marionnettiste = Marionnettiste.new()

func _ready() -> void:
	for i in range(10):
		var day=false
		if i%2 == 0:
			day=true
			M.pass_jour()
		else:
			M.pass_nuit()
		for action in M.actions:
			action.reload(day)
		var a = M.takeAction(day)
		print(day)
		print(a.dmg)
		print(a.cooldown)
		a.turnsBeforeUse = a.cooldown
