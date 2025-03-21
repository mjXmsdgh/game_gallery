extends Node2D

# 二次関数を扱うノード

# 二次関数の係数 (y = ax^2 + bx + c)
var a: float = 1.0  # 二次項の係数 (デフォルト値: 1.0)
var b: float = 0.0  # 一次項の係数 (デフォルト値: 0.0)
var c: float = 0.0  # 定数項 (デフォルト値: 0.0)

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
