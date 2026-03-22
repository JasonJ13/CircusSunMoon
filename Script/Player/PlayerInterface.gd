extends Control
class_name PlayerInterface


@onready var HP_player = $HP_player


@export var debug : bool = false

var hp_player : int


var size_spell : float
var nmb_spell : int

@onready var spellsNode : Control = $Spells
@onready var confirmNode : Control = $Confirm
@onready var backButton : Button = $Confirm/Back
@onready var confirmButton : Button = $Confirm/Confirm
@onready var descriptionLabel : Label = $Confirm/Description
@onready var ennemieLifeLabel : Label = $Confirm/EnnemieLife

var buttons : Array[Button] = []


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
	


func free_all() -> void :
	for button in buttons :
		button.queue_free()
	buttons.clear()


func _ready_Spell(spells : Array[Spell]) -> void :
	nmb_spell = len(spells)
	free_all()

	for i in range(nmb_spell) :
		var new_spell_button := Button.new()
		new_spell_button.icon = spells[i].spellTexture
		new_spell_button.flat = true
		new_spell_button.position.x = size_spell*i/nmb_spell + size_spell/(nmb_spell*4)
		
		var label_button = Label.new()
		label_button.text = spells[i].name
		label_button.scale /= 4
		label_button.size = Vector2(284,156)
		label_button.position -= new_spell_button.size/2
		label_button.label_settings = preload("res://Asset/Font/button_font.tres")
		label_button.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		label_button.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
		label_button.set_anchors_preset(Control.PRESET_CENTER)
		new_spell_button.add_child(label_button)
		
		
		if spells[i].usable() :
			var pressed := Callable(self, "spell_has_been_selected").bind(spells[i])
			new_spell_button.pressed.connect(pressed)
			
			var entered := Callable(self,"mouse_as_entered").bind(new_spell_button)
			new_spell_button.mouse_entered.connect(entered)
			
			var exited := Callable(self,"mouse_as_exited").bind(new_spell_button)
			new_spell_button.mouse_exited.connect(exited)
		
		else :
			new_spell_button.modulate = Color.DARK_GRAY
		
		spellsNode.add_child(new_spell_button)

func start(hpp : int, enn : Monster, spells : Array[Spell]) -> void:
	HP_player.value = hpp
	if enn != null :
		ennemieLifeLabel.text = enn.name + " :\n" + str(enn.hp) + " / " + str(enn.hp_max)
	_ready_Spell(spells)
	spellsNode.show()



func mouse_as_entered(button : Button) -> void :
	button.modulate = Color.LIGHT_GREEN

func mouse_as_exited(button : Button) -> void :
	button.modulate = Color.WHITE




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
