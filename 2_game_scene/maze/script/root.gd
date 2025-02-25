extends Node2D

@export var start_scene_resource:PackedScene  # start
@export var main_scene_resource:PackedScene   # main
@export var end_scene_resource:PackedScene    # end

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# シグナル
	$Start.connect("change_to_main",start_to_main)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func start_to_main()->void:
	
	# mainシーンをload
	var main_scene:Node=main_scene_resource.instantiate()
	
	# 子ノードに追加
	add_child(main_scene)
	
	# シグナルを接続
	$Main.connect("main_to_end",main_to_end)
	
	# Startノードを開放
	$Start.queue_free()

func main_to_end()->void:
	# endシーンをload
	var end_scene:Node=end_scene_resource.instantiate()
	
	# 子ノードに追加
	add_child(end_scene)
	
	# シグナルを接続
	$End.connect("end_to_start",end_to_main)
	
	# mainノードを開放
	$Main.queue_free()


func end_to_main()->void:
	
	# startシーンをload
	var start_scene:Node=start_scene_resource.instantiate()
	
	# 子ノードに追加
	add_child(start_scene)
	
	# シグナルを接続
	$Start.connect("change_to_main",start_to_main)
	
	# endノードを開放
	$End.queue_free()
