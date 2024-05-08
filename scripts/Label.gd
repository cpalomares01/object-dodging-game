extends Label

@onready

var high_score_label: Label

#func _ready():
#	high_score_label = $"../ScoreLabel"

func update_score_label():
	#score = high_score
	self.text = "Score: " #d+ str(score)
