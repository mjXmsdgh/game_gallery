extends Node2D

# 再急降下法の計算を担当するノード

# 二次関数の係数 (y = ax^2 + bx + c)
var a: float = 1.0  # 二次項の係数
var b: float = 0.0  # 一次項の係数
var c: float = 0.0  # 定数項

# 現在の点
var current_point: Vector2 = Vector2(2, quadratic_function(2))
# 次の点
var next_point: Vector2 = Vector2()

#学習率
var learning_rate: float = 0.01

# 勾配
func gradient(x :float)->float:
	return 2*a*x+b

# 二次関数の計算
func quadratic_function(x: float) -> float:
	return a * pow(x, 2) + b * x + c

# 次のステップに進む
func step_forward() -> void:
	print("Calculation step_forward")
	var x = current_point.x
	var g = gradient(x)
	var next_x = x - learning_rate * g
	next_point = Vector2(next_x, quadratic_function(next_x))
	current_point = next_point

	# 計算の終了条件などをここに追加できます（例: 勾配がほぼゼロになったら終了など）


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
