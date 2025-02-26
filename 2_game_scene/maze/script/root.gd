extends Node2D

const StartScene:PackedScene=preload("res://2_game_scene/maze/scene/start.tscn")
const MainScene:PackedScene=preload("res://2_game_scene/maze/scene/main.tscn")
const EndScene:PackedScene=preload("res://2_game_scene/maze/scene/end.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# シグナル
	$Start.connect("change_to_main",start_to_main)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func start_to_main()->void:
	
	# mainシーンを実体化
	var main_scene:Node=MainScene.instantiate()
	
	# 子ノードに追加
	add_child(main_scene)
	
	# シグナルを接続
	$Main.connect("main_to_end",main_to_end)
	
	# Startノードを開放
	$Start.queue_free()

func main_to_end()->void:

	# endシーンを実体化
	var end_scene:Node=EndScene.instantiate()
	
	# 子ノードに追加
	add_child(end_scene)
	
	# シグナルを接続
	$End.connect("end_to_start",end_to_main)
	
	# mainノードを開放
	$Main.queue_free()


func end_to_main()->void:
	
	# startシーンを実体化
	var start_scene:Node=StartScene.instantiate()
	
	# 子ノードに追加
	add_child(start_scene)
	
	# シグナルを接続
	$Start.connect("change_to_main",start_to_main)
	
	# endノードを開放
	$End.queue_free()
