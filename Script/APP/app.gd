extends Control

# Signals 
# -----------

signal game_start



# Methods 
# ------------

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



# Main Menu signals 
# ---------------------

func _on_main_menu_on_play() -> void:
	game_start.emit()


func _on_main_menu_on_quit() -> void:
	get_tree().quit()
