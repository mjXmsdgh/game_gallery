extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	show_start_scene()



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	

func show_start_scene()->void:
	$Start.visible=true
	
	$Main.visible=false
	$Main.process_mode=Node.PROCESS_MODE_DISABLED
	
	$End.visible=false
	$End.process_mode=Node.PROCESS_MODE_DISABLED
	
