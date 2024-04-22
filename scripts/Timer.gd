extends Timer

var saw = preload("res://scenes/saw.tscn")
var saw_heights = [60, 120, 180, 240, 300, 360, 420, 480, 540]

func _ready():
	wait_time = .4
	#wait_time = randf_range(0,1)

#spawns saws in random position on a set timer
func _on_timeout():
	# Randomly select an integer from myArray
	var saw_height = saw_heights[randi() % saw_heights.size()]
	#wait_time = randf_range(0,1)
	randomize()
	var next_obstacle = saw.instantiate()
	next_obstacle.position = Vector2(-100, saw_height)
	#next_obstacle.position = Vector2(-100, randi_range(0, 555))
	add_child(next_obstacle)
