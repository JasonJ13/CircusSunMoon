extends Node
class_name sfx

# Signals
# ------------
signal play_sountrack
signal stop_soundtrack



# Variables 
# ----------------- 
var _SunBuse:int = AudioServer.get_bus_index("Sun")
# var _MoonBuse:int = AudioServer.get_bus_index("Moon")

var _isToSun:bool
var _isToMoon:bool

var _soundCursor:float



# Methods 
# -------------------

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# tests 
	#await get_tree().create_timer(5.0).timeout
	#toMoon()
	#await get_tree().create_timer(5.0).timeout
	#toSun()
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if _isToMoon:
		if _soundCursor <= 0: 
			_isToMoon = false
			AudioServer.set_bus_volume_linear(_SunBuse, 0.0)
		else: 
			AudioServer.set_bus_volume_linear(_SunBuse, _soundCursor)
			_soundCursor -= delta * 1/1
	
	
	if _isToSun:
		if _soundCursor >= 1: 
			_isToSun = false
			AudioServer.set_bus_volume_linear(_SunBuse, 1.0)
		else:
			AudioServer.set_bus_volume_linear(_SunBuse, _soundCursor)
			_soundCursor += delta * 1/1


func toSun() -> void:
	_soundCursor = 0.0
	_isToSun = true
	# AudioServer.set_bus_volume_linear(SunBuse, 1.0)


func toMoon() -> void:
	_soundCursor = 1.0
	_isToMoon = true
	# AudioServer.set_bus_volume_linear(SunBuse, 0.0)


func start_soundtracks() -> void:
	play_sountrack.emit()
	
func stop_soundtracks() -> void:
	stop_soundtrack.emit()


# Signals from OTHERS
# ----------------------

func _on_app_game_start() -> void:
	start_soundtracks()


func _on_fight_to_day() -> void:
	toSun()


func _on_fight_to_night() -> void:
	toMoon()
