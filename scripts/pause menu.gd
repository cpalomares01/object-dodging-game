extends Control

@onready var main = $"../"

func _on_continue_pressed():
	main.pauseMenu()

func _on_main_menu_pressed():
	main.pauseMenu()
	get_tree().change_scene_to_file("res://scenes/menus/main menu.tscn")
