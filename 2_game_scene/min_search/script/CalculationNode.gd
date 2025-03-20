extends Node2D

# 最急降下法の計算を担当するノード

# 二次関数の係数 (y = ax^2 + bx + c)
var a: float = 1.0  # 二次項の係数 (デフォルト値: 1.0)
var b: float = 0.0  # 一次項の係数 (デフォルト値: 0.0)
var c: float = 0.0  # 定数項 (デフォルト値: 0.0)

# 計算開始地点
var starting_x: float = 2.0  # 計算開始時のx座標 (デフォルト値: 2.0)
var current_x: float = starting_x  # 現在のx座標
var current_y: float = quadratic_function(starting_x)  # 現在のy座標 (初期値は開始地点のy座標)

# 学習率
var learning_rate_x: float = 0.1  # x方向の学習率 (デフォルト値: 0.1)

# point_managerノードへの参照
var point_manager_node  # 点を管理するPointManagerノードへの参照

# 勾配
func gradient(x: float) -> float:
	"""
	二次関数の勾配を計算する関数。
	Args:
		x: x座標
	Returns:
		x座標における勾配
	"""
	return 2 * a * x + b  # 勾配の計算式 (2ax + b)

# 二次関数の計算
func quadratic_function(x: float) -> float:
	"""
	二次関数の値を計算する関数。
	Args:
		x: x座標
	Returns:
		x座標における二次関数の値
	"""
	return a * pow(x, 2) + b * x + c  # 二次関数の計算式 (ax^2 + bx + c)

# 次のステップに進む
func step_forward() -> Vector2:
	"""
	最急降下法による次のステップを計算する関数。
	Returns:
		現在の座標(Vector2)
	"""
	var g: float = gradient(current_x)  # 現在のx座標における勾配を計算
	var next_x: float = current_x - learning_rate_x * g  # 次のx座標を計算 (現在のx座標 - 学習率 * 勾配)
	var next_y: float = quadratic_function(next_x)  # 次のx座標におけるy座標を計算
	var next_point: Vector2 = Vector2(next_x, next_y)  # 次の点をVector2として作成

	if point_manager_node != null:  # point_manager_nodeが存在する場合
		point_manager_node.add_point({"color": Color.GREEN}, next_point)  # 点をpoint_manager_nodeに追加
	else:  # point_manager_nodeが存在しない場合
		push_error("point_manager_node is null")  # エラーメッセージをコンソールに出力
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
	point_manager_node = get_node_or_null("../AxisNode/PointManager")  # PointManagerノードを取得
