extends Node2D

# 再急降下法の計算を担当するノード

# 二次関数の係数 (y = ax^2 + bx + c)
var a: float = 1.0  # 二次項の係数
var b: float = 0.0  # 一次項の係数
var c: float = 0.0  # 定数項

# 現在の点
var initial_x: float = 2.0
var current_point: Vector2 = Vector2(initial_x, quadratic_function(initial_x))

#学習率
var learning_rate: float = 0.1

# point_managerノードへの参照
var point_manager_node

# 勾配
func gradient(x :float)->float:
	return 2*a*x+b

# 二次関数の計算
func quadratic_function(x: float) -> float:
	return a * pow(x, 2) + b * x + c

# 次のステップに進む
func step_forward() -> Vector2:
	var x = current_point.x
	var g = gradient(x)
	var next_x = x - learning_rate * g
	var next_y = quadratic_function(next_x)
	var next_point = Vector2(next_x, next_y)

	if point_manager_node != null:
		point_manager_node.add_point({"color": Color.GREEN}, next_point)
	else:
		push_error("point_manager_node is null")
	current_point = next_point
	# 計算の終了条件
	# 例：勾配の絶対値が0.001以下になったら終了
	if abs(g) < 0.001:
		print("calculation is ended")
	
	return current_point


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	point_manager_node = get_node_or_null("../AxisNode/PointManager")
	pass # Replace with function body.