extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# シグナル
	$Start.connect("change_to_main",start_to_main)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func start_to_main()->void:
	
	# mainシーンをload
	var main_scene:Node=load("res://2_game_scene/maze/scene/main.tscn").instantiate()
	
	# 子ノードに追加
	add_child(main_scene)
	
	# Startノードを開放
	$Start.queue_free()
