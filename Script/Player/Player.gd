extends Control
class_name Player

var hp: int = 100
var playerTurn: bool = false
@onready var interface: Control = $PlayerInterface
const hpmax: int = 100
var actions: Array[Action] = [] #Toutes les actions possibles

@onready var sprite : AnimatedSprite2D = $SpritePlayer/Sprite

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	actions.append(Action.new(100,0,0,true,Action.Change.NONE))
	actions.append(Action.new(250,2,0,false,Action.Change.DAY))
	actions.append(Action.new(150,1,0,false,Action.Change.DAY))
	pass
		
func takeAction(ennemies: Array[Monster]) -> Action:
	#à faire: Envoyer les ennemies, les pvs du joueur et ses actions à PlayerInterface
	return null


func dayTime() -> void :
	sprite.play("Day")

func nightTime() -> void :
	sprite.play("Night")
