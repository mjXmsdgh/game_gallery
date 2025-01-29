extends Area2D
var speed=400

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.y=position.y-speed*delta
	
	# 画面外に出たら弾を削除する
	if position.y>get_viewport_rect().size.y:
		queue_free()
	
func delete() -> void:
	queue_free()
