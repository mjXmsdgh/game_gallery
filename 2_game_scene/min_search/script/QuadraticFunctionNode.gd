extends Node2D

# 二次関数を扱うノード

# 二次関数の係数 (y = ax^2 + bx + c)
var a: float = 1.0  # 二次項の係数 (デフォルト値: 1.0)
var b: float = 0.0  # 一次項の係数 (デフォルト値: 0.0)
var c: float = 0.0  # 定数項 (デフォルト値: 0.0)

# 係数のランダム範囲
var a_min: float = 0.1
var a_max: float = 5.0
var b_min: float = -10.0
var b_max: float = 10.0
var c_min: float = -10.0
var c_max: float = 10.0

func _ready():
	randomize() # 乱数シードを初期化
	set_random_coefficients()

# ランダムな係数を設定する関数
func set_random_coefficients():
	# a は 0 にならないようにする
	while true:
		a = randf_range(a_min, a_max)
		if abs(a) > 0.01: # 0に近い値も除外
			break
		if a>0:
			break
	b = randf_range(b_min, b_max)
	c = randf_range(c_min, c_max)
	print("a:",a,"b:",b,"c:",c)

# 二次関数の計算
func calculate(x: float) -> float:
	"""
	二次関数の値を計算する関数。
	Args:
		x: x座標
	Returns:
		x座標における二次関数の値
	"""
	return a * pow(x, 2) + b * x + c  # 二次関数の計算式 (ax^2 + bx + c)

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
