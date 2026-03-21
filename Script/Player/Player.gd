extends Control
class_name Player

var hp: int = 1000
var playerTurn: bool = false
@onready var interface: PlayerInterface = $PlayerInterface
const hpmax: int = 1000
var actions: Array[Spell] = [] #Toutes les actions possibles
var dmgInflictModifier: float = 1
var dmgReceiveModifier: float = 1

var ennemie : Monster

@onready var sprite : AnimatedSprite2D = $SpritePlayer/Sprite

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	actions.append(Spell.new(100,0,0,true,Action.Change.NONE,Action.Effect.DMG,preload("res://Asset/other/bouton spell.png"), preload("res://Asset/other/bouton spell hovered.png")))
	actions.append(Spell.new(250,2,0,false,Action.Change.DAY,Action.Effect.DMG,preload("res://Asset/other/bouton spell.png"), preload("res://Asset/other/bouton spell hovered.png")))
	actions.append(Spell.new(150,1,0,false,Action.Change.DAY,Action.Effect.DMG,preload("res://Asset/other/bouton spell.png"), preload("res://Asset/other/bouton spell hovered.png")))
	#Multiplicateur de degat (prendre en pourcentage)
	actions.append(Spell.new(75,1,0,true,Action.Change.NIGHT,Action.Effect.INFLICT,preload("res://Asset/other/bouton spell.png"), preload("res://Asset/other/bouton spell hovered.png")))
	#Reduction de degat (prendre en pourcentage)
	actions.append(Spell.new(50,1,0,true,Action.Change.NIGHT,Action.Effect.RECEIVE,preload("res://Asset/other/bouton spell.png"), preload("res://Asset/other/bouton spell hovered.png")))
	interface.start(hpmax,ennemie,actions)


func takeAction(ennemie : Monster) -> Action:
	interface.start(hp, ennemie, actions)
	var x = await interface.action
	if x.effect == Action.Effect.INFLICT:
		dmgInflictModifier = 0.75
		x.dmg = 0
	elif x.effect == Action.Effect.RECEIVE:
		dmgReceiveModifier = 50
		x.dmg = 0
	
	return x

func dayTime() -> void :
	sprite.play("Day")

func nightTime() -> void :
	sprite.play("Night")
