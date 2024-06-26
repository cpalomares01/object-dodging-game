extends Timer

var saw = load("res://scenes/saw.tscn")
var saw_heights = [60, 120, 180, 240, 300, 360, 420, 480, 550]

func _ready():
	wait_time = 1

#spawns saws in random position on a set timer
func _on_timeout():
	# Randomly select an integer from myArray
	var saw_height = saw_heights[randi() % saw_heights.size()]
	randomize()
	var next_obstacle = saw.instantiate()
	next_obstacle.position = Vector2(-100, saw_height)
	add_child(next_obstacle)
	
	#increases spawn interval as game progresses
	if wait_time > .4:
		wait_time -= .01
