extends Node2D


var points: Array[Dictionary]=[]


#点を追加する
func add_point(point_data: Dictionary) -> void:
	points.append(point_data)
	#親に通知する、再描画イベントを発行する


#点を削除する
func remove_point(index: int) -> void:
	if index >= 0 and index < points.size():
		points.remove_at(index)
		#親に通知する、再描画イベントを発行する


#全ての点を削除
func clear_point()->void:
	points.clear()
	#親に通知する、再描画イベントを発行する。


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
