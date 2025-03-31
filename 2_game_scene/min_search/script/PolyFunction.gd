extends Node2D

const PI = 3.14159265358979323846

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func calculate(x: float) -> float:
	# Rastrigin関数の1次元近似
	return (10 + x * x - 10 * cos(2 * PI * x)-5)*0.2

func gradient(x: float) -> float:
	# Rastrigin関数の勾配
	return 2 * x + 20 * PI * sin(2 * PI * x)
