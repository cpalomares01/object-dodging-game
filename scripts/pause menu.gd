extends Control

@onready var main = $"../"

func _on_continue_pressed():
	main.pauseMenu()

func _on_main_menu_pressed():
	pass
