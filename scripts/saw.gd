extends Area2D

@onready var main = $'../../'

func _process(delta):
	position.x += 7

func _on_body_entered(body):
	if body.is_in_group("player"):
		main.gameOver()
