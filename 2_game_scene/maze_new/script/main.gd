extends Node2D
@export var end_scene:PackedScene;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func change_scene()->void:
	
	# 終了画面に変更
	get_tree().change_scene_to_file("res://2_game_scene/maze_new/scene/end.tscn")
