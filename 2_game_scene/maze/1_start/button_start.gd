extends Button


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	# スタイルを作成
	var stylebox=StyleBoxFlat.new()
	stylebox.bg_color=Color(0,0,0)

	# 適用
	add_theme_stylebox_override("normal",stylebox)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_pressed() -> void:
	get_tree().change_scene_to_file("res://game_scene/maze/2_main/maze.tscn")
