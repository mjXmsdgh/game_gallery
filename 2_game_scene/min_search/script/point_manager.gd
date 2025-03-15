extends Node2D


var points: Array[Dictionary]=[]


#点を追加する
func add_point(point_data: Dictionary,point:Vector2) -> void:
	var new_point_data=point_data.duplicate()
	new_point_data.pos=point
	points.append(new_point_data)
	get_node("PointNode").queue_redraw()
	# 親ノード（PointNode）に再描画を通知する
	##	get_node("PointNode").queue_redraw()


#点を削除する
func remove_point(index: int) -> void:
	if index >= 0 and index < points.size():
		points.remove_at(index)

		# 親ノード（PointNode）に再描画を通知する
		get_node("PointNode").queue_redraw()


#全ての点を削除
func clear_point()->void:
	points.clear()
	# 親ノード（PointNode）に再描画を通知する
	if get_parent().has_method("queue_redraw"):
		get_node("PointNode").queue_redraw()


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_point({"color": Color.RED},Vector2(0,0)) # ダミーで入れておく
	add_point({"color": Color.BLUE},Vector2(0,0)) # ダミーで入れておく


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
