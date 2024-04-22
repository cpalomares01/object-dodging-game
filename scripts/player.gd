extends CharacterBody2D

const MAX_SPEED = 300
const ACCELERATION = 50
const FRICTION = 20
const JUMP_VELOCITY = -2000
const GRAVITY = 5000

#var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var input = Vector2.ZERO

func _physics_process(delta):
	var input_direction: Vector2 = get_input()
	
	if input_direction != Vector2.ZERO:
		accelerate(input_direction)
	else:
		decelerate()
	player_movement(delta)
	
	velocity.y += GRAVITY * delta
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