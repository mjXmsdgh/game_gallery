extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var time:String=Global.get_time()
	
	$"clear_time".text="Clear Time : "+time
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_go_to_start_pressed() -> void:
	get_tree().change_scene_to_file("res://2_game_scene/maze/scene/start.tscn")
