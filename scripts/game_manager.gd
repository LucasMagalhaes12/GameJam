extends Node
#@onready var score_label: Label = $score
@onready var camera: Camera2D = $"../Camera2D"
@onready var score_label: Label = $"../CanvasLayer/score"
@onready var record_label: Label = $"../CanvasLayer/record"

var score = 0
var coin_score = 0
var record = 0

func add_coin_score():
	coin_score += 10
	show_score()

func set_points_score(score_value: float):
	score = abs(int(score_value) - 318) / 10
	show_score()

func show_score():
	if record < score + coin_score:
		record = score + coin_score
	score_label.text = "PONTOS: " + str(score + coin_score)
	record_label.text = "Recorde: " + str(record)
