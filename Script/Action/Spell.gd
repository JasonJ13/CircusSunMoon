extends Action
class_name Spell

var spellTexture : Texture2D
var spellTextureHover : Texture2D


func _init(d:int, co:int, t:int, s:bool, ch:Change, sT : Texture2D, sTH : Texture2D) -> void :
	dmg = d
	cooldown = co
	turnsBeforeUse = t
	stateToReload = s
	change = ch
	spellTexture = sT
	spellTextureHover = sTH
