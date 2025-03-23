extends Node2D


var a: float=1.0
var b: float=2.0
var c: float=3.9
var d: float=4.0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.



func calculate(x: float) -> float:

	return a*x*x*x+b*x*x+c*x+d


func gradient(x: float) -> float:
	return 3*a*x*x+2*b*x+c
