extends Control
class_name Player

var hp: int = 1000
var playerTurn: bool = false
@onready var interface: PlayerInterface = $PlayerInterface
const hpmax: int = 1000
var actions: Array[Spell] = [] #Toutes les actions possibles
var dmgInflictModifier: float = 1
var dmgInflictModifierTurn: int = 0
var dmgReceiveModifier: float = 1
var dmgReceiveModifierTurn: int = 0
var dayTurn: int = 0
var dayBefore: bool = false

var ennemie : Monster

@onready var sprite : AnimatedSprite2D = $SpritePlayer/Sprite

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	actions.append(Spell.new(100,0,0,true,Action.Change.NONE,Action.Effect.BASE,preload("res://Asset/pixel/Sun_skill_UI.png")))
	actions[-1].add_name_and_description("Ball Bounce","Deals 100 damage, decrease if cycle doesn't change")
	actions.append(Spell.new(250,3,0,false,Action.Change.DAY,Action.Effect.DMG,preload("res://Asset/pixel/Sun_skill_UI.png")))
	actions[-1].add_name_and_description("Astral Blast","Deals 250 damage")
	actions.append(Spell.new(150,2,0,false,Action.Change.DAY,Action.Effect.DMG,preload("res://Asset/pixel/Sun_skill_UI.png")))
	actions[-1].add_name_and_description("Astral Flash","Deals 150 damage")
	actions.append(Spell.new(0,2,0,true,Action.Change.NIGHT,Action.Effect.INFLICT,preload("res://Asset/pixel/Moon_skill_UI.png")))
	actions[-1].add_name_and_description("Lunar Harvest","Damage Deals +75% for the next turn")
	actions.append(Spell.new(0,2,0,true,Action.Change.NIGHT,Action.Effect.RECEIVE,preload("res://Asset/pixel/Moon_skill_UI.png")))
	actions[-1].add_name_and_description("Stellar Protection","Damage received -50% for the turn")
	interface.start(hpmax,ennemie,actions)


func takeAction(enn : Monster, day : bool) -> Action:
	interface.start(hp, enn, actions)
	var x = await interface.action
	if  dayBefore == day:
		dayTurn += 1
	else :
		dayTurn = 0
			
	dayBefore = day
	if dmgInflictModifierTurn > 0:
		dmgInflictModifierTurn -= 1
	if dmgReceiveModifierTurn > 0:
		dmgReceiveModifierTurn -= 1
	if dmgInflictModifierTurn == 0:
		dmgInflictModifier = 1
	if dmgReceiveModifierTurn == 0:
		dmgReceiveModifier = 1
	if x.effect == Action.Effect.BASE:
		if dayTurn == 0:
			x.dmg = 100
		elif dayTurn == 1:
			x.dmg = 50
		else:
			x.dmg = 0
	if x.effect == Action.Effect.INFLICT:
		dmgInflictModifier = 1.75
		dmgInflictModifierTurn = 2
		x.dmg = 0
	elif x.effect == Action.Effect.RECEIVE:
		dmgReceiveModifier = 0.5
		dmgInflictModifierTurn = 2
		x.dmg = 0
	
	if x.change == Action.Change.DAY && !day :
		dayTime()
	elif x.change == Action.Change.NIGHT && day :
		nightTime()
	
	return x

func dayTime() -> void :
	sprite.play("Day")

func nightTime() -> void :
	sprite.play("Night")
