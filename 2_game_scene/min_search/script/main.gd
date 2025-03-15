extends Node2D

@onready var root_node = $XyAxis

func _input(event):
	if event.is_action_pressed("key_space"):
		root_node.get_node("CalculationNode").step_forward()
		#root_node.get_node("AxisNode").get_node("PointManager").clear_point()
