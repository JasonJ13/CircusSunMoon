extends Action
class_name Spell

var spellTexture : Texture2D

var name : String
var description : String

## d : dmg, co : cooldown, t : turnsBeforeUse, s : stateToReload, ch : Change, ef : effect, sT : texture du bouton, sTh : texture sélectionner
func _init(d:int, co:int, t:int, s:bool, ch:Change, ef:Effect, sT : Texture2D) -> void :
	dmg = d
	cooldown = co
	turnsBeforeUse = t
	stateToReload = s
	change = ch
	effect = ef
	spellTexture = sT
	name = "spell who deal " + str(dmg) + " damage"
	description = "Description indisponible"

func usable() -> bool:
	if turnsBeforeUse > 0 :
		return false
	return true

## n : nom du spell / descr : description du spell
func add_name_and_description(n : String, descr : String) -> void:
	name = n
	description = descr

func _to_string() -> String:
	var string : String = ""
	
	string += "Spell : " + name + "\n"
	string += "cooldown : " + str(cooldown) 
	if stateToReload:
		string += " days" + "\n"
	else:
		string += " nights" + "\n"
	
	match change :
		Action.Change.DAY :
			string += "Switch to day\n"
		Action.Change.NIGHT :
			string += "Switch to night\n"
	
	string += description
	
	return string
