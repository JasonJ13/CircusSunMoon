extends Node

@onready var animation : AnimationPlayer = $AnimationPlayer

func day_to_night() -> void :
	animation.play("night_time")

func night_to_day() -> void :
	animation.play_backwards("night_time")
