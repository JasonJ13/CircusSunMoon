extends Control
class_name PlayerInterface

@onready var Spell1 = $Spell1
@onready var Spell2 = $Spell2
@onready var Spell3 = $Spell3
@onready var Spell4 = $Spell4
@onready var Spell5 = $Spell5
@onready var Back = $Back
@onready var HP_player = $HP_player
@onready var NomMonstre1 = $NomMonstre1
@onready var NomMonstre2 = $NomMonstre2
@onready var NomMonstre3 = $NomMonstre3
@onready var ButtonNomMonster = $boutonNomMonstre1
@onready var ButtonNomMonster2 = $boutonNomMonstre2
@onready var ButtonNomMonster3 = $boutonNomMonstre3


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

var nom_ennemies : Array[String]
var HP_ennemies : Array[int]


signal action(var1 : int, var2 : int)

var spellvalue : int

func _ready() -> void:
	NomMonstre1.text = "monstre1"
	NomMonstre2.text = "monstre2"
	NomMonstre3.text = "monstre3"
	NomMonstre1.hide()
	NomMonstre2.hide()
	NomMonstre3.hide()
	ButtonNomMonster.hide()
	ButtonNomMonster2.hide()
	ButtonNomMonster3.hide()
	Spell1.show()
	Spell2.show()
	Spell3.show()
	Spell4.show()
	Spell5.show()
	Back.hide()

func start(hp_player,ennemies,spells) -> void:
	HP_player.value = hp_player
	ennemies = ennemies
	spells = spells
	for i in range(ennemies.length):
		nom_ennemies[i] = ennemies.nom
		HP_ennemies[i] = ennemies.hp
	
	

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
	spellvalue = 1
	Spell1.hide()
	Spell2.hide()
	Spell3.hide()
	Spell4.hide()
	Spell5.hide()
	NomMonstre1.show()
	NomMonstre2.show()
	NomMonstre3.show()
	ButtonNomMonster.show()
	ButtonNomMonster2.show()
	ButtonNomMonster3.show()
	Back.show()
func _on_spell_2_pressed() -> void:
	spellvalue = 2
	Spell1.hide()
	Spell2.hide()
	Spell3.hide()
	Spell4.hide()
	Spell5.hide()
	NomMonstre1.show()
	NomMonstre2.show()
	NomMonstre3.show()
	ButtonNomMonster.show()
	ButtonNomMonster2.show()
	ButtonNomMonster3.show()
	Back.show()
func _on_spell_3_pressed() -> void:
	spellvalue = 3
	Spell1.hide()
	Spell2.hide()
	Spell3.hide()
	Spell4.hide()
	Spell5.hide()
	NomMonstre1.show()
	NomMonstre2.show()
	NomMonstre3.show()
	ButtonNomMonster.show()
	ButtonNomMonster2.show()
	ButtonNomMonster3.show()
	Back.show()
func _on_spell_4_pressed() -> void:
	spellvalue = 4
	Spell1.hide()
	Spell2.hide()
	Spell3.hide()
	Spell4.hide()
	Spell5.hide()
	NomMonstre1.show()
	NomMonstre2.show()
	NomMonstre3.show()
	ButtonNomMonster.show()
	ButtonNomMonster2.show()
	ButtonNomMonster3.show()
	Back.show()
func _on_spell_5_pressed() -> void:
	spellvalue = 5
	Spell1.hide()
	Spell2.hide()
	Spell3.hide()
	Spell4.hide()
	Spell5.hide()
	NomMonstre1.show()
	NomMonstre2.show()
	NomMonstre3.show()
	ButtonNomMonster.show()
	ButtonNomMonster2.show()
	ButtonNomMonster3.show()
	Back.show()
func _on_back_pressed() -> void:
	Spell1.show()
	Spell2.show()
	Spell3.show()
	Spell4.show()
	Spell5.show()
	NomMonstre1.hide()
	NomMonstre2.hide()
	NomMonstre3.hide()
	ButtonNomMonster.hide()
	ButtonNomMonster2.hide()
	ButtonNomMonster3.hide()
	Back.hide()

func _on_bouton_nom_monstre_1_mouse_entered() -> void:
	NomMonstre1.modulate = Color.YELLOW
func _on_bouton_nom_monstre_1_mouse_exited() -> void:
	NomMonstre1.modulate = Color.WHITE
func _on_bouton_nom_monstre_2_mouse_entered() -> void:
	NomMonstre2.modulate = Color.YELLOW
func _on_bouton_nom_monstre_2_mouse_exited() -> void:
	NomMonstre2.modulate = Color.WHITE
func _on_bouton_nom_monstre_3_mouse_entered() -> void:
	NomMonstre3.modulate = Color.YELLOW
func _on_bouton_nom_monstre_3_mouse_exited() -> void:
	NomMonstre3.modulate = Color.WHITE

func _on_bouton_nom_monstre_1_pressed() -> void:
	action.emit(spellvalue, 1)
	NomMonstre1.hide()
	NomMonstre2.hide()
	NomMonstre3.hide()
	ButtonNomMonster.hide()
	ButtonNomMonster2.hide()
	ButtonNomMonster3.hide()
	Back.hide()
func _on_bouton_nom_monstre_2_pressed() -> void:
	action.emit(spellvalue,2)
	NomMonstre1.hide()
	NomMonstre2.hide()
	NomMonstre3.hide()
	ButtonNomMonster.hide()
	ButtonNomMonster2.hide()
	ButtonNomMonster3.hide()
	Back.hide()
func _on_bouton_nom_monstre_3_pressed() -> void:
	action.emit(spellvalue, 3)
	NomMonstre1.hide()
	NomMonstre2.hide()
	NomMonstre3.hide()
	ButtonNomMonster.hide()
	ButtonNomMonster2.hide()
	ButtonNomMonster3.hide()
	Back.hide()
