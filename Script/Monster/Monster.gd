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

func take_dmg(dmg_taken : int) :
	hp -= dmg_taken
	hp = min(hp, hp_max)
	print(hp)
	if dmg_taken > 0 :
		if monsterAnimation != null :
			monsterAnimation.pause()
		
		
		animation.play("Hurt")
		await animation.animation_finished
		animation.play("Iddle")
		
		if monsterAnimation != null :
			monsterAnimation.play()

func your_turn(day:bool) -> Action :
	var action : Action = takeAction(day)
	
	if monsterAnimation != null :
		monsterAnimation.pause()
	
	match action.cible :
		Action.Cible.PLAYER :
			animation.play("Attack")
		Action.Cible.MONSTER :
			animation.play("Self")
	
	await animation.animation_finished
	
	animation.play("Iddle")
	if monsterAnimation != null :
		monsterAnimation.play()
	
	return action
