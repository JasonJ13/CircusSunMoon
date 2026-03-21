extends Control
class_name Player

var hp: int = 1000
var playerTurn: bool = false
@onready var interface: PlayerInterface = $PlayerInterface
const hpmax: int = 1000
var actions: Array[Spell] = [] #Toutes les actions possibles
var dmgModifier: float = 1

var ennemies : Array[Monster] = []

@onready var sprite : AnimatedSprite2D = $SpritePlayer/Sprite

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	actions.append(Spell.new(100,0,0,true,Action.Change.NONE,preload("res://Asset/other/bouton spell.png"), preload("res://Asset/other/bouton spell hovered.png")))
	actions.append(Spell.new(250,2,0,false,Action.Change.DAY,preload("res://Asset/other/bouton spell.png"), preload("res://Asset/other/bouton spell hovered.png")))
	actions.append(Spell.new(150,1,0,false,Action.Change.DAY,preload("res://Asset/other/bouton spell.png"), preload("res://Asset/other/bouton spell hovered.png")))
	#Multiplicateur de degat (prendre en pourcentage)
	actions.append(Spell.new(75,1,0,true,Action.Change.NIGHT,preload("res://Asset/other/bouton spell.png"), preload("res://Asset/other/bouton spell hovered.png")))
	#Reduction de degat (prendre en pourcentage)
	actions.append(Spell.new(50,1,0,true,Action.Change.NIGHT,preload("res://Asset/other/bouton spell.png"), preload("res://Asset/other/bouton spell hovered.png")))
	interface.start(hpmax,ennemies,actions)


func takeAction(ennemies: Array[Monster]) -> Action:
	interface.start(hp, ennemies, actions)
	var x = await interface.action
	var res: Action = actions[x[0]]
	if x[1] == 0:
		res.cible= Action.Cible.PLAYER
	else:	
		res.cible = Action.Cible.MONSTER
	return res

func dayTime() -> void :
	sprite.play("Day")

func nightTime() -> void :
	sprite.play("Night")
