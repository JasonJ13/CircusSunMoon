extends Control

# Node 
# -----------

@onready var mainMenu : Control = $MainMenu
@onready var fight : Fight
@onready var gameOver : Control = $GameOver
@onready var sfx : sfx = $Soundtrack

var fightRess : Resource = load("res://Scene/Fight/Fight.tscn")



func to_menu() -> void :
	gameOver.hide()
	mainMenu.show()



func _on_main_menu_on_quit() -> void:
	get_tree().quit()


func player_died() :
	fight.queue_free()
	gameOver.show()


func play_game() -> void :
	sfx.start_soundtracks()
	gameOver.hide()
	mainMenu.hide()
	
	fight = fightRess.instantiate()
	fight.playerDied.connect(player_died)
	add_child(fight)
