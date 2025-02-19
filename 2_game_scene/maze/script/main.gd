extends Node2D

@export var scene_path="res://2_game_scene/maze/scene/end.tscn"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func change_scene()->void:
	call_deferred("change_scene_deferred")
	
	
func change_scene_deferred():

	# 終了画面に変更
	get_tree().change_scene_to_file(scene_path)
