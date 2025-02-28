extends Area2D
const SPEED=400 # 弾の移動速度

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:

	# 弾を移動させる
	position.y=position.y-SPEED*delta
	
func destroy() -> void:

	# ノードを削除
	queue_free()


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:

	#カメラの外に出たので削除
	destroy()
