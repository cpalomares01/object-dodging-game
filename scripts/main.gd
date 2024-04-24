extends Node

@onready var pause_menu = $"Pause Menu"
@onready var game_over = $"Game Over"
@onready var saw = "res://scenes/saw.tscn"

var paused = false
var is_alive = true

func _process(delta):
	if Input.is_action_just_pressed("pause"):
		pauseMenu()

func pauseMenu():
	if paused:
		pause_menu.hide()
		get_tree().paused = false
	else:
		pause_menu.show()
		get_tree().paused = true
	paused = !paused
