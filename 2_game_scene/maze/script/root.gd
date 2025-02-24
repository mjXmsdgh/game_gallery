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
	print(main_scene.name)
	
	# シグナルを接続
	$Main.connect("main_to_end",main_to_end)
	
	# Startノードを開放
	$Start.queue_free()

func main_to_end()->void:
	print("main_to_end")
	
	# endシーンをload
	var end_scene:Node=load("res://2_game_scene/maze/scene/end.tscn").instantiate()
	
	# 子ノードに追加
	add_child(end_scene)
	
	#$End.connect("main_to_end",)
	
	$Main.queue_free()
