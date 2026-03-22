@abstract
extends Control
class_name Monster



var hp: int
var hp_max : int
var dmg: int
var nom: String
var actions: Array[Action] = []
#@onready var interface: Control = $MonsterInterface

var animation : AnimatedSprite2D
var animation_player : AnimationPlayer = null

#éxecuté lorsqu'on passe du nuit au jour	
@abstract func pass_jour() -> void

#éxécuté lorsqu'on passe du jour à la nuit
@abstract func pass_nuit() -> void

#Choisis une action à effectuer
@abstract func takeAction(day:bool) -> Action


func your_turn(day:bool) -> Action :
	if animation_player != null :
		animation_player.pause()
	
	animation.play("Attack")
	
	await animation.animation_finished
	animation.play("Iddle")
	
	if animation_player != null :
		animation_player.play()
	
	return takeAction(day)
