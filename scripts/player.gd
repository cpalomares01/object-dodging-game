extends CharacterBody2D

signal killed

#constants
const MAX_SPEED := 600
const ACCELERATION = 70
const FRICTION = 50
const JUMP_VELOCITY = -900
const GRAVITY = 2500

#variables
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
