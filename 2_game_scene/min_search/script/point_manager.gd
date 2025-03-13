extends Node2D


var points: Array[Dictionary]=[]


#点を追加する
func add_point(point_data: Dictionary) -> void:
	points.append(point_data)
	# 親ノード（PointNode）に再描画を通知する
	if get_parent().has_method("queue_redraw"):
		get_parent().queue_redraw()


#点を削除する
func remove_point(index: int) -> void:
	if index >= 0 and index < points.size():
		points.remove_at(index)

		# 親ノード（PointNode）に再描画を通知する
		if get_parent().has_method("queue_redraw"):
			get_parent().queue_redraw()


#全ての点を削除
func clear_point()->void:
	points.clear()
	# 親ノード（PointNode）に再描画を通知する
	if get_parent().has_method("queue_redraw"):
		get_parent().queue_redraw()


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
