extends Node2D

# 点のデータを管理するノード

# Pointの型を定義
class PointData:
	var color: Color
	var pos: Vector2

# PointDataを要素とするTypedArrayを定義
var points: Array[PointData] = []

var PointNode: Node2D = null

#定数化
const INITIAL_POINTS: Array[Dictionary] = [
	{"color": Color.RED, "pos": Vector2(2, 4)},
	{"color": Color.BLUE, "pos": Vector2(0, 0)},
]

signal points_changed

# 点を追加する
func add_point(point_data: Dictionary, point: Vector2) -> void:
	"""
	新しい点をpoints配列に追加します。

	Args:
		point_data (Dictionary): 点の情報を格納した辞書（例: {"color": Color.RED}）。
		point (Vector2): 点の座標。
	"""
	# point_dataをコピーして、元のデータに影響を与えないようにする。
	var new_point_data: Dictionary = point_data.duplicate()

	# 点の座標を辞書に追加する。
	new_point_data.pos = point
	
	# PointData型に変換
	var typed_point_data: PointData = PointData.new()
	typed_point_data.color = new_point_data.color
	typed_point_data.pos = new_point_data.pos
	
	# points配列に新しい点を追加する。
	points.append(typed_point_data)

	# 親ノード（PointNode）に再描画を通知する。
	PointNode.queue_redraw()

	points_changed.emit()


# 点を削除する
func remove_point(index: int) -> void:
	"""
	points配列から、指定されたインデックスの点を削除します。

	Args:
		index (int): 削除する点のインデックス。
	"""

	# インデックスが有効な範囲内にあるかチェックする。
	if index<0:
		return
	if index >= points.size():
		return

	# 指定されたインデックスの点を削除する。
	points.remove_at(index)

	points_changed.emit()


# 全ての点を削除する
func clear_point() -> void:
	"""
	points配列を空にし、全ての点を削除します。
	"""
	# points配列を空にする。
	points.clear()

	points_changed.emit()


# 点の情報をDictionaryの配列として返す
func get_points() -> Array[Dictionary]:
	var point_dicts: Array[Dictionary] = []
	for point_data in points:
		point_dicts.append({
			"color": point_data.color,
			"pos": point_data.pos
		})
	return point_dicts


# ノードがシーンツリーに追加されたときに呼び出される
func _ready() -> void:
	"""
	ノードの初期化処理。
	"""
	#PointNodeの参照を取得
	PointNode = get_node_or_null("PointDrawer")

	if PointNode == null:
		push_error("Error: PointNode not found.")
		return

	#初期の点を追加
	for point_info in INITIAL_POINTS:
		add_point(point_info, point_info.pos)
