extends Area2D
var speed=400

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.y=position.y-speed*delta
	
func delete() -> void:
	queue_free()


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	#カメラの外に出たので削除
	delete()
