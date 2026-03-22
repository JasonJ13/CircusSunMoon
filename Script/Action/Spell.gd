extends Action
class_name Spell

var spellTexture : Texture2D
var spellTextureHover : Texture2D

var name : String
var description : String

func _init(d:int, co:int, t:int, s:bool, ch:Change, ef:Effect, sT : Texture2D, sTH : Texture2D) -> void :
	dmg = d
	cooldown = co
	turnsBeforeUse = t
	stateToReload = s
	change = ch
	effect = ef
	spellTexture = sT
	spellTextureHover = sTH
	name = "spell who deal " + str(dmg) + " damage"
	description = "Description indisponible"

func usable() -> bool:
	if turnsBeforeUse > 0 :
		return false
	return true

func add_name_and_description(n : String, descr : String) -> void:
	name = n
	description = descr

func _to_string() -> String:
	var string : String = ""
	
	string += "Spell : " + name + "\n"
	string += "Value : " + str(dmg) +"    cooldown : " + str(cooldown) + "\n"
	
	match change :
		Action.Change.DAY :
			string += "Passe au jour\n"
		Action.Change.NIGHT :
			string += "Passe à la nuit\n"
	
	string += description
	
	return string
