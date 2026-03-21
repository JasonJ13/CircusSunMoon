extends Control

# Signals 
# -------------

signal on_quit
signal on_play


# Internal Signals 
# ------------------

func _on_play_button_pressed() -> void:
	visible = false
	on_play.emit()


func _on_play_buton_pressed() -> void:
	visible = false
	on_play.emit()


func _on_quit_buton_pressed() -> void:
	on_quit.emit()
