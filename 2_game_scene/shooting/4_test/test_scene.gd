extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	# シグナルを接続する
	$enemy.connect("enemy_deleted",enemy_deleted)
	$Goal_flag.connect("goal_signal",goal_func)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func enemy_deleted() -> void:
	print("delete enemy")


func goal_func() -> void:
	print("goal ")
