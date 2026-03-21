extends Control

# Variables 
# ------------
var _MasterBus:int = AudioServer.get_bus_index("Master")
var _SoundtrackBus:int = AudioServer.get_bus_index("Sountrack")
var _SFXBus:int = AudioServer.get_bus_index("SFX")



# Internal signals
# -----------------------

func _on_close_setting_pressed() -> void:
	visible = false


# Sliders 
# ------------

func _on_master_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_linear(_MasterBus, value)


func _on_soundtrack_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_linear(_SoundtrackBus, value)


func _on_sfx_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_linear(_SFXBus, value)



# Signals from outside
# --------------------
func _on_sound_setting_button_pressed() -> void:
	visible = true
