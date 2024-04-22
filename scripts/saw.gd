extends Area2D
	
@onready var main = preload("res://scenes/main.tscn").instantiate()

func _process(delta):
	position.x += 7

func _on_body_entered(body):
	print("Collided with player")
	if body.is_in_group("player"):
		main.gameOver()
		print("debug")
