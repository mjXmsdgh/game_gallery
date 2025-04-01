extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# 軸の最大値と最小値
var x_min: float = -10.0
var x_max: float = 10.0
var y_min: float = -10.0
var y_max: float = 10.0



# x軸の範囲を設定
func set_x_range(x_min_val: float, x_max_val: float) -> void:
	x_min=x_min_val
	x_max=x_max_val

	queue_redraw()

# y軸の範囲を設定
func set_y_range(y_min_val: float, y_max_val: float) -> void:
	y_min=y_min_val
	y_max=y_max_val

	queue_redraw()


# 各プロパティのアクセサ
func get_x_min() -> float:
	return x_min

func get_x_max() -> float:
	return x_max

func get_y_min() -> float:
	return y_min

func get_y_max() -> float:
	return y_max
