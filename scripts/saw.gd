extends Area2D



func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x += 7


func _on_body_entered(body):
	print("Collided with player")
	pass # Replace with function body.
