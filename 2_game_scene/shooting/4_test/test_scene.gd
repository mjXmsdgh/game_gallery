extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	# シグナルを接続する
	$enemy.connect("enemy_deleted",test_func)
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func test_func() -> void:
	print("get")
