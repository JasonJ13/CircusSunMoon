extends Node
class_name sfx

# Signals
# ------------

@onready var gameoversong: AudioStreamPlayer = $Circusover
@onready var circus_sun : AudioStreamPlayer = $CircusSun
@onready var circus_moon : AudioStreamPlayer = $CircusMoon

# Variables 
# ----------------- 
var _SunBuse:int = AudioServer.get_bus_index("Sun")
# var _MoonBuse:int = AudioServer.get_bus_index("Moon")

var _isToSun:bool
var _isToMoon:bool

var _soundCursor:float



# Methods 
# -------------------

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


func toMoon() -> void:
	_soundCursor = 1.0
	_isToMoon = true


func start_soundtracks() -> void:
	circus_sun.play()
	circus_moon.play()
	
func stop_soundtracks() -> void:
	circus_sun.stop()
	circus_moon.stop()

func play_gameover() -> void:
	gameoversong.play()

# Signals from OTHERS
# ----------------------

func _on_fight_to_day() -> void:
	toSun()


func _on_fight_to_night() -> void:
	toMoon()
