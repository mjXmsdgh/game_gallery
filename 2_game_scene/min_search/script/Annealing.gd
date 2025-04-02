# 焼きなまし法の実装  <-- このコメントをここに移動する

extends Node2D

# 計算開始地点
var starting_x: float = 5.0
var current_x: float = starting_x
var current_y: float = 0.0

# 焼きなまし法パラメータ
var initial_temperature: float = 100.0 # 初期温度
var cooling_rate: float = 0.95 # 冷却率
var random_range: float = 0.5 # 近傍のランダム範囲
var min_temperature: float = 0.001 # 終了温度
var temperature: float = initial_temperature
var current_energy: float = 0.0
var next_energy: float = 0.0

# point_managerノードへの参照
var point_manager_node: Node

# 関数ノードへの参照
var poly_func_node: Node2D

# 計算が終了したかどうか
var is_finished: bool = false

# 初期化
func _ready() -> void:
	point_manager_node = get_node_or_null("../Data/PointManager")
	if point_manager_node == null:
		push_error("point_manager_node is null")

	poly_func_node = get_node_or_null("../Data/PolyFunction")
	if poly_func_node == null:
		push_error("poly_func_node is null")

	current_y = poly_func_node.calculate(starting_x)
	current_energy = poly_func_node.calculate(current_x)

	# 焼きなまし法の初期化
	temperature = initial_temperature
	is_finished = false

# 次のステップに進む
func step_forward() -> Vector2:
	if is_finished:
		return Vector2(current_x, current_y)

	# 現在のエネルギーを計算
	current_energy = poly_func_node.calculate(current_x)

	# 近傍の解を生成
	var next_x: float = current_x + randf_range(-random_range, random_range)
	next_x = clamp(next_x, -10, 10) #範囲を制限する

	# 近傍の解のエネルギーを計算
	next_energy = poly_func_node.calculate(next_x)

	# エネルギー差を計算
	var delta_energy: float = next_energy - current_energy

	# 受理確率を計算
	var accept_probability: float
	if delta_energy < 0:
		accept_probability = 1.0
	else:
		accept_probability = exp(-delta_energy / temperature)

	# 受理判定
	if randf() < accept_probability:
		current_x = next_x
		current_energy = next_energy

	# 現在のy座標を更新
	current_y = poly_func_node.calculate(current_x)

	# 点を追加
	point_manager_node.add_point({"color": Color.GREEN}, Vector2(current_x, current_y))

	# 温度を下げる
	temperature *= cooling_rate

	# 終了条件
	if temperature < min_temperature:
		print("calculation is ended")
		is_finished = true

	return Vector2(current_x, current_y)

# 計算が終了したかどうかを返す
func is_calculation_finished() -> bool:
	return is_finished

# 計算をリセットする
func reset_calculation() -> void:
	current_x = starting_x
	current_y = poly_func_node.calculate(starting_x)
	current_energy = poly_func_node.calculate(current_x)
	temperature = initial_temperature
	is_finished = false
	print("calculation is reset")
