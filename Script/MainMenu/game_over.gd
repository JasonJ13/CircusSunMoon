extends Control

signal menu
signal retry


func backToMainMenu() -> void:
	menu.emit()

func retryGame() -> void :
	retry.emit()
