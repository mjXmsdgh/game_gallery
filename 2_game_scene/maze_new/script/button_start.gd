extends Button

@export var main_scene:PackedScene;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_pressed() -> void:

	# mazeを実体化
	var main_instance:Node=main_scene.instantiate()

	# 子ノードに追加
	var root:Node=get_tree().get_root()
	root.add_child(main_instance)

	# 終わったら開放
	get_tree().current_scene.queue_free()	
