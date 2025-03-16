extends Node2D

# 点のデータを管理するノード

# 点の情報を格納する配列
var points: Array[Dictionary] = []
# 各要素は辞書型で、{"color": Color.RED, "pos": Vector2(0, 0)} のように点を表す。

# 点を追加する
func add_point(point_data: Dictionary, point: Vector2) -> void:
	"""
	新しい点をpoints配列に追加します。

	Args:
		point_data (Dictionary): 点の情報を格納した辞書（例: {"color": Color.RED}）。
		point (Vector2): 点の座標。
	"""
	# point_dataをコピーして、元のデータに影響を与えないようにする。
	var new_point_data = point_data.duplicate()

	# 点の座標を辞書に追加する。
	new_point_data.pos = point

	# points配列に新しい点を追加する。
	points.append(new_point_data)

	# 親ノード（PointNode）に再描画を通知する。
	get_node("PointNode").queue_redraw()


# 点を削除する
func remove_point(index: int) -> void:
	"""
	points配列から、指定されたインデックスの点を削除します。

	Args:
		index (int): 削除する点のインデックス。
	"""
	# インデックスが有効な範囲内にあるかチェックする。
	if index >= 0 and index < points.size():

		# 指定されたインデックスの点を削除する。
		points.remove_at(index)

		# 親ノード（PointNode）に再描画を通知する。
		get_node("PointNode").queue_redraw()

# 全ての点を削除する
func clear_point() -> void:
	"""
	points配列を空にし、全ての点を削除します。
	"""
	# points配列を空にする。
	points.clear()

	# 親ノード（PointNode）に再描画を通知する。
	if get_parent().has_method("queue_redraw"):
		get_node("PointNode").queue_redraw()

# ノードがシーンツリーに追加されたときに呼び出される
func _ready() -> void:
	"""
	ノードの初期化処理。
	"""
	#初期の点を追加
	add_point({"color": Color.RED}, Vector2(2, 4))
	add_point({"color": Color.BLUE}, Vector2(0, 0))


# 毎フレーム呼び出される
func _process(delta: float) -> void:
	"""
	毎フレームの処理。
	現在は何も行わない。
	"""
	pass
