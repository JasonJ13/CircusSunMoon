extends Control

@onready var start_button = $Button2
@onready var options_button1 = $Button3
@onready var options_button2 = $Button4
@onready var quit_button = $quit



var spell : Texture2D = preload("res://Asset/other/bouton spell hovered.png")
var spellhover : Texture2D = preload("res://Asset/other/bouton spell.png")
var spell1 : Texture2D = preload("res://Asset/other/spell1hover.PNG")
var spell1hover : Texture2D = preload("res://Asset/other/spell1.PNG")
var spell2 : Texture2D = preload("res://Asset/other/spell2hover.PNG")
var spell2hover : Texture2D = preload("res://Asset/other/spell2.PNG")
var quit : Texture2D = preload("res://Asset/other/quit.PNG")
var quithover : Texture2D = preload("res://Asset/other/quithover.png")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	start_button.show()
	options_button1.hide()
	options_button2.hide()
	quit_button.hide()

func _on_mouse_entered():
	start_button.icon = spell
func _on_mouse_exited():
	start_button.icon = spellhover
func _on_button_3_mouse_entered() -> void:
	options_button1.icon = spell1
func _on_button_3_mouse_exited() -> void:
	options_button1.icon = spell1hover
func _on_button_4_mouse_entered() -> void:
	options_button2.icon = spell2
func _on_button_4_mouse_exited() -> void:
	options_button2.icon = spell2hover
func _on_quit_mouse_entered() -> void:
	quit_button.icon = quithover
func _on_quit_mouse_exited() -> void:
	quit_button.icon = quit

	
	
func _on_button_2_pressed() -> void:
	start_button.hide()
	options_button1.show()
	options_button2.show()
	quit_button.show()


func _on_quit_pressed() -> void:
	start_button.show()
	options_button1.hide()
	options_button2.hide()
	quit_button.hide()
