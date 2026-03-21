extends Control
class_name PlayerInterface

"""@onready var Spell1 = $Spells/Spell1
@onready var Spell2 = $Spells/Spell2
@onready var Spell3 = $Spells/Spell3
@onready var Spell4 = $Spells/Spell4
@onready var Spell5 = $Spells/Spell5"""
@onready var Back = $Back
@onready var HP_player = $HP_player
@onready var NomMonstre1 = $Monstres/NomMonstre1
@onready var NomMonstre2 = $Monstres/NomMonstre2
@onready var NomMonstre3 = $Monstres/NomMonstre3
@onready var ButtonNomMonster = $Monstres/boutonNomMonstre1
@onready var ButtonNomMonster2 = $Monstres/boutonNomMonstre2
@onready var ButtonNomMonster3 = $Monstres/boutonNomMonstre3
@onready var monstresNode : Control = $Monstres



var spellButton : Array[Button] = []
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
var ennemies: Array[Monster] = []
var spells : Array[Spell] = []

var nom_ennemies : Array[String] = []
var HP_ennemies : Array[int] = []


var spellvalue : int
@onready var spellsNode : Control = $Spells

signal action(var1 : int, var2 : int)



func _ready() -> void:
	NomMonstre1.text = "monstre1"
	NomMonstre2.text = "monstre2"
	NomMonstre3.text = "monstre3"
	monstresNode.hide()

	spellsNode.show()
	Back.hide()


func _ready_Spell() -> void :
	for spell in spells :
		var new_spell_button := Button.new()
		new_spell_button.icon = spell.spellTexture
		new_spell_button.scale = Vector2(0.1,0.1)
		spellsNode.add_child(new_spell_button)

func start(hp_player,ennemies,sps) -> void:
	HP_player.value = hp_player
	ennemies = ennemies
	spells = sps
	_ready_Spell()
	#for i in range(len(ennemies)):
	#	nom_ennemies[i] = ennemies[i].nom
	#	HP_ennemies[i] = ennemies[i].hp


"""func _on_spell_1_mouse_entered() -> void:
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
	Back.icon = back"""



func spell_selected(ind_spell : int) -> void :
	spellvalue = ind_spell
	
	spellsNode.hide()
	monstresNode.show()
	Back.show()



	
func _on_back_pressed() -> void:
	spellsNode.show()
	monstresNode.hide()
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
