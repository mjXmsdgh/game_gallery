extends Node

var clear_time:String

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func set_time(input_time:String)->void:
	clear_time=input_time
	
func get_time()->String:
	return clear_time
