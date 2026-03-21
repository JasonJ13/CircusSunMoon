extends Node

@onready var Spell1 = $Spell1
@onready var Spell2 = $Spell2
@onready var Spell3 = $Spell3
@onready var Spell4 = $Spell4
@onready var Spell5 = $Spell5
@onready var Back = $Back
@onready var HP_player = $HP_player


var spell1 : Texture2D = preload("res://Asset/other/bouton spell.png")
var spell1hover : Texture2D = preload("res://Asset/other/bouton spell hovered.png")
var spell2 : Texture2D = preload("res://Asset/other/bouton spell.png")
var spell2hover : Texture2D = preload("res://Asset/other/bouton spell hovered.png")
var spell3 : Texture2D = preload("res://Asset/other/bouton spell.png")
var spell3hover : Texture2D = preload("res://Asset/other/bouton spell hovered.png")
var spell4 : Texture2D = preload("res://Asset/other/bouton spell.png")
var spell4hover : Texture2D = preload("res://Asset/other/bouton spell hovered.png")
var spell5 : Texture2D = preload("res://Asset/other/bouton spell.png")
var spell5hover : Texture2D = preload("res://Asset/other/bouton spell hovered.png")
var back : Texture2D = preload("res://Asset/other/back.png")
var backhover : Texture2D = preload("res://Asset/other/backhover.png")

var hp_player : int
var ennemies: Array[Monster]
var spells : Array[Action]

func _ready() -> void:
	Spell1.show()
	Spell2.show()
	Spell3.show()
	Spell4.show()
	Spell5.show()
	Back.hide()

func start(hp_player,ennemies,spells) -> void:
	HP_player.value = hp_player
	
	

func _on_spell_1_mouse_entered() -> void:
	Spell1.icon = spell1hover
func _on_spell_1_mouse_exited() -> void:
	Spell1.icon = spell1
func _on_spell_2_mouse_entered() -> void:
	Spell2.icon = spell2hover
func _on_spell_2_mouse_exited() -> void:
	Spell2.icon = spell2
func _on_spell_3_mouse_entered() -> void:
	Spell3.icon = spell3hover
func _on_spell_3_mouse_exited() -> void:
	Spell3.icon = spell3
func _on_spell_4_mouse_entered() -> void:
	Spell4.icon = spell4hover
func _on_spell_4_mouse_exited() -> void:
	Spell4.icon = spell4
func _on_spell_5_mouse_entered() -> void:
	Spell5.icon = spell5hover
func _on_spell_5_mouse_exited() -> void:
	Spell5.icon = spell5
func _on_back_mouse_entered() -> void:
	Back.icon = backhover
func _on_back_mouse_exited() -> void:
	Back.icon = back

func _on_spell_1_pressed() -> void:
	Spell1.hide()
	Spell2.hide()
	Spell3.hide()
	Spell4.hide()
	Spell5.hide()
	Back.show()
func _on_spell_2_pressed() -> void:
	Spell1.hide()
	Spell2.hide()
	Spell3.hide()
	Spell4.hide()
	Spell5.hide()
	Back.show()
func _on_spell_3_pressed() -> void:
	Spell1.hide()
	Spell2.hide()
	Spell3.hide()
	Spell4.hide()
	Spell5.hide()
	Back.show()
func _on_spell_4_pressed() -> void:
	Spell1.hide()
	Spell2.hide()
	Spell3.hide()
	Spell4.hide()
	Spell5.hide()
	Back.show()
func _on_spell_5_pressed() -> void:
	Spell1.hide()
	Spell2.hide()
	Spell3.hide()
	Spell4.hide()
	Spell5.hide()
	Back.show()
func _on_back_pressed() -> void:
	Spell1.show()
	Spell2.show()
	Spell3.show()
	Spell4.show()
	Spell5.show()
	Back.hide()
