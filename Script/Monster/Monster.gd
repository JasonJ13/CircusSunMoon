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
var monsterAnimation : AnimationPlayer = null
var dmgAnimation : AnimationPlayer
var dmgLabel : Label

#éxecuté lorsqu'on passe du nuit au jour	
@abstract func pass_jour() -> void

#éxécuté lorsqu'on passe du jour à la nuit
@abstract func pass_nuit() -> void

#Choisis une action à effectuer
@abstract func takeAction(day:bool) -> Action

func take_dmg(dmg_taken : int) -> void :
	hp -= dmg_taken
	hp = min(hp, hp_max)
	
	if monsterAnimation != null :
		monsterAnimation.pause()
	
	dmgLabel.text = str(abs(dmg_taken))
	if dmg_taken > 0 :
		dmgLabel.modulate = Color.RED
		animation.play("Hurt")
	else :
		dmgLabel.modulate = Color.GREEN
		animation.play("Self")
	
	dmgAnimation.play("label faided")
	await animation.animation_finished
	animation.play("Iddle")
		
	if monsterAnimation != null :
		monsterAnimation.play()
	
	return

func your_turn(day:bool) -> Action :
	var action : Action = takeAction(day)
	
	if monsterAnimation != null :
		monsterAnimation.pause()
	
	if action.cible == Action.Cible.PLAYER :
		animation.play("Attack")
		await animation.animation_finished
	
	animation.play("Iddle")
	if monsterAnimation != null :
		monsterAnimation.play()
	
	return action
