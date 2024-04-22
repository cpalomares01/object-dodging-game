extends CharacterBody2D

#constants
const MAX_SPEED = 300
const ACCELERATION = 50
const FRICTION = 20
const JUMP_VELOCITY = -1000
const GRAVITY = 2500

#variables
var input = Vector2.ZERO
var max_jumps = 2
var jump_count = 0

func _physics_process(delta):
	var input_direction: Vector2 = get_input()
	
	if input_direction != Vector2.ZERO:
		accelerate(input_direction)
	else:
		decelerate()
	player_movement(delta)
	
	velocity.y += GRAVITY * delta
	handle_jumps()
	player_movement(delta)

func get_input() -> Vector2:
	var input_direction = Vector2.ZERO
	
	input_direction.x = Input.get_axis("left","right")
	input_direction = input_direction
	return input_direction

func accelerate(direction):
	velocity = velocity.move_toward(MAX_SPEED * direction, ACCELERATION)

func decelerate():
	velocity = velocity.move_toward(Vector2.ZERO, FRICTION)

func player_movement(delta):
	move_and_slide()

func handle_jumps():
	if Input.is_action_just_pressed("jump"):
		if is_on_floor():
			jump_count = 0
			velocity.y = JUMP_VELOCITY
			jump_count += 1
		if not is_on_floor() and jump_count < max_jumps:
			velocity.y = JUMP_VELOCITY
			jump_count += 1
