extends Control
class_name PlayerInterface


@onready var HP_player = $HP_player


@export var debug : bool = false


var back : Texture2D = preload("res://Asset/other/back.png")
var backhover : Texture2D = preload("res://Asset/other/backhover.png")

var hp_player : int
var ennemie : Monster

var size_spell : float
var nmb_spell : int

@onready var spellsNode : Control = $Spells
@onready var confirmNode : Control = $Confirm
@onready var backButton : Button = $Confirm/Back
@onready var confirmButton : Button = $Confirm/Confirm
@onready var descriptionLabel : Label = $Confirm/Description

var spell_selected : Spell
signal action(spell : Spell)

func _ready() -> void:

	spellsNode.hide()
	confirmNode.hide()
	
	size_spell = spellsNode.size.x
	
	
	
	if debug :
		nmb_spell = 4
		for i in range (nmb_spell) :
			var new_spell_button := Button.new()
			new_spell_button.icon = preload("res://Asset/other/bouton spell.png")
			new_spell_button.position.x = size_spell*i/nmb_spell + size_spell/(nmb_spell*2)
			spellsNode.add_child(new_spell_button)
	


func _ready_Spell(spells : Array[Spell]) -> void :
	nmb_spell = len(spells)
	for i in range(nmb_spell) :
		var new_spell_button := Button.new()
		new_spell_button.icon = spells[i].spellTexture
		new_spell_button.position.x = size_spell*i/nmb_spell + size_spell/(nmb_spell*4)
		
		
		if spells[i].usable() :
			var pressed := Callable(self, "spell_has_been_selected").bind(spells[i])
			new_spell_button.pressed.connect(pressed)
			
			var entered := Callable(self,"mouse_as_entered").bind(new_spell_button, spells[i])
			new_spell_button.mouse_entered.connect(entered)
			
			var exited := Callable(self,"mouse_as_exited").bind(new_spell_button, spells[i])
			new_spell_button.mouse_exited.connect(exited)
		
		else :
			new_spell_button.modulate = Color.DARK_GRAY
		
		spellsNode.add_child(new_spell_button)

func start(hpp : int, enn : Monster, sps : Array[Spell]) -> void:
	HP_player.value = hpp
	ennemie = enn
	_ready_Spell(sps)
	spellsNode.show()



func mouse_as_entered(button : Button, spell : Spell) -> void :
	button.icon = spell.spellTextureHover

func mouse_as_exited(button : Button, spell : Spell) -> void :
	button.icon = spell.spellTexture


func _on_back_mouse_entered() -> void:
	backButton.icon = backhover

func _on_back_mouse_exited() -> void:
	backButton.icon = back

func _on_confirm_mouse_entered() -> void:
	confirmButton.icon = backhover

func _on_confirm_mouse_exited() -> void:
	confirmButton.icon = back

func spell_has_been_selected(spell : Spell) -> void :
	spell_selected = spell
	spell.cible = Action.Cible.MONSTER
	
	descriptionLabel.text = str(spell)
	
	spellsNode.hide()
	confirmNode.show()


func spell_deny() -> void:
	spellsNode.show()
	confirmNode.hide()

func spell_confirm() -> void:

	confirmNode.hide()
	action.emit(spell_selected)
