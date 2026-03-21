extends Control
class_name Player

var hp: int = 100
var playerTurn: bool = false
@onready var interface: PlayerInterface = $PlayerInterface
const hpmax: int = 100
var actions: Array[Action] = [] #Toutes les actions possibles

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	actions.append(Action.new(100,0,0,true,Action.Change.NONE))
	actions.append(Action.new(250,2,0,false,Action.Change.DAY))
	actions.append(Action.new(150,1,0,false,Action.Change.DAY))
	pass



func takeAction(ennemies: Array[Monster]) -> Action:
	interface.start(hp, ennemies, actions)
	var x = await interface.action
	var res: Action = actions[x[0]]
	if x[1] == 0:
		res.cible=self
	else:	
		res.cible = ennemies[x[1]-1]
	return res
