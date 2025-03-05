extends Node2D

# シグナル
signal end_to_start

# スコア
var clear_score:int=0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Label.text=str(clear_score)


func _on_button_pressed() -> void:

	# シグナルを発信
	emit_signal("end_to_start")


func init_score(input_score:int)->void:

	# スコアを設定
	clear_score=input_score

	# Labelに設定
	$Label.text=str(clear_score)