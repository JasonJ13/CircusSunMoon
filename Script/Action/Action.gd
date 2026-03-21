class_name Action

enum Change {DAY, NIGHT, NONE}
enum Cible {PLAYER, MONSTER}
enum Effect {RECEIVE, INFLICT, DMG}

var dmg: int
var cible: Cible
var cooldown: int = 0				#Nombre de tours avant de pouvoir réutiliser l'attaque lorsqu'on l'utilise
var turnsBeforeUse: int = 0			#Nombre de tours actuel à attendre avant de pouvoir réutiliser l'attaque
var stateToReload: bool				#Etat de l'environnement permettant de recharger l'attaque (true = jour)
var change: Change = Change.NONE	#Etat de l'environnement après l'action
var effect: Effect

func _init(d:int, co:int, t:int, s:bool, ch:Change, ef: Effect) -> void :
	dmg = d
	cooldown = co
	turnsBeforeUse = t
	stateToReload = s
	change = ch
	effect = ef

func reload(state: bool):
	if turnsBeforeUse>0 and stateToReload == state:
		turnsBeforeUse-=1
