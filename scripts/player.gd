extends CharacterBody2D

@onready var main = $'../../'

#constants
const MAX_SPEED := 600
const ACCELERATION = 100
const FRICTION = 100
const JUMP_VELOCITY = -900
const GRAVITY = 2500

#variables
var can_double_jump = true

func _physics_process(delta):
#region jump handler
	if is_on_floor():
		can_double_jump = true

	if Input.is_action_just_pressed("jump"):
		if is_on_floor() || !$CoyoteTimer.is_stopped() :
			can_double_jump = true
			velocity.y = JUMP_VELOCITY
			$"../LowJumpSound".play()
		elif can_double_jump:
			can_double_jump = false
			velocity.y = JUMP_VELOCITY
			$"../HighJumpSound".play()
	else:
		velocity.y += GRAVITY * delta

#endregion
#region movement

	var direction = Input.get_axis("left","right")
	velocity.x = move_toward(velocity.x, MAX_SPEED * direction, ACCELERATION)
	var was_on_floor = is_on_floor()
	move_and_slide()
	
	if was_on_floor && !is_on_floor():
		$CoyoteTimer.start()

#endregion

	if position.y > 800:
		main.gameOver()
