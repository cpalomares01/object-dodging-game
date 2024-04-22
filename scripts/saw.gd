extends Area2D

func _process(delta):
	position.x += 7

func _on_body_entered(body):
	print("Collided with player")
	game_over()

func game_over():
	pass
