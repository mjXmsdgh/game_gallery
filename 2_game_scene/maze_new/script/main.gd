extends Node2D
@export var end_scene:PackedScene;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func change_scene()->void:

	# mazeを実体化
	var end_instance:Node=end_scene.instantiate()

	# 子ノードに追加
	var root:Node=get_tree().get_root()
	root.add_child(end_instance)

	# 終わったら開放
	get_tree().current_scene.queue_free()	
