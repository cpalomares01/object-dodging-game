extends Control

@onready var game_over = $"../"

func _on_retry_pressed():
	get_tree().reload_current_scene()

func _on_main_menu_pressed():
	pass # Replace with function body.
