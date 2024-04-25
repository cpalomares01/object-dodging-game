extends Timer

var score = 0
var score_label: Label

func _ready():
	score_label = $"../ScoreLabel"
	update_score_label()

func update_score_label():
	score_label.text = "Score: " + str(score)

func _on_timeout():
	score += 1
	update_score_label()
