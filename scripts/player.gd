extends CharacterBody2D

@onready var game_over = "res://scenes/menus/game over menu.tscn"

#constants
const MAX_SPEED := 600
const ACCELERATION = 100
const FRICTION = 100
const JUMP_VELOCITY = -900
const GRAVITY = 2500

#variables
var is_alive = true
var max_jumps = 2
var jump_count = 0

func _physics_process(delta):
#region jump handler

	if Input.is_action_just_pressed("jump"):
		if is_on_floor():
			jump_count = 0
			velocity.y = JUMP_VELOCITY
			$"../LowJumpSound".play()
			jump_count += 1
		if not is_on_floor() and jump_count < max_jumps:
			velocity.y = JUMP_VELOCITY
			$"../HighJumpSound".play()
			jump_count += 1
	else:
		velocity.y += GRAVITY * delta

#endregion
#region movement

	var direction = Input.get_axis("left","right")
	
	velocity.x = move_toward(velocity.x, MAX_SPEED * direction, ACCELERATION)
	move_and_slide()

#endregion

func gameOver():
	if is_alive:
		game_over.hide()
		get_tree().paused = false
	else:
		game_over.show()
		get_tree().paused = true
	is_alive = !is_alive
