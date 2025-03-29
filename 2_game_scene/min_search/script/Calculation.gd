extends Node2D

# 最急降下法の計算を担当するノード

# 計算開始地点
var starting_x: float = 0.5  # 計算開始時のx座標 (デフォルト値: 2.0)
var current_x: float = starting_x  # 現在のx座標
var current_y: float = 0.0  # 現在のy座標 (初期値は開始地点のy座標)

# 学習率
var learning_rate_x: float = 0.1  # x方向の学習率 (デフォルト値: 0.1)

# point_managerノードへの参照
var point_manager_node: Node  # 点を管理するPointManagerノードへの参照

# 関数ノードへの参照
var poly_func_node:Node2D

# 次のステップに進む
func step_forward() -> Vector2:
	"""
	最急降下法による次のステップを計算する関数。
	Returns:
		現在の座標(Vector2)
	"""

	var g: float = poly_func_node.gradient(current_x)  # 現在のx座標における勾配を計算
	var next_x: float = current_x - learning_rate_x * g  # 次のx座標を計算 (現在のx座標 - 学習率 * 勾配)
	var next_y: float = poly_func_node.calculate(next_x)  # 次のx座標におけるy座標を計算

	var next_point: Vector2 = Vector2(next_x, next_y)  # 次の点をVector2として作成

	point_manager_node.add_point({"color": Color.GREEN}, next_point)  # 点をpoint_manager_nodeに追加

	current_x = next_x  # 現在のx座標を更新
	current_y = next_y  # 現在のy座標を更新

	# 計算の終了条件
	# 例：勾配の絶対値が0.001以下になったら終了
	if abs(g) < 0.001:  # 勾配の絶対値が0.001未満の場合
		print("calculation is ended")  # 計算終了のメッセージをコンソールに出力

	return Vector2(current_x,current_y) #現在の座標を返す

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	"""
	ノードがシーンツリーに追加されたときに一度だけ呼ばれる関数。
	"""
	point_manager_node = get_node_or_null("../Data/PointManager")  # PointManagerノードを取得

	if point_manager_node == null:
		push_error("point_manager_node is null")

	poly_func_node=get_node_or_null("../Data/PolyFunction")
	current_y=poly_func_node.calculate(starting_x)
