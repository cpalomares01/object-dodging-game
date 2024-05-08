extends Node

@onready var pause_menu = $"PauseMenu"
@onready var game_over = $"GameOver"

var paused = false
var alive = true

func _ready():
	$"Music".play()

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

func gameOver():
	$"PlayerDeathSFX".play()
	if alive:
		game_over.show()
		get_tree().paused = true
	else:
		get_tree().paused = false
	alive = !alive
