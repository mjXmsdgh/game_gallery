extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if Input.is_action_just_pressed("ui_up"):
		$player._on_button_up_pressed()
		
	if Input.is_action_just_pressed("ui_down"):
		$player._on_button_down_pressed()
		
	if Input.is_action_just_pressed("ui_left"):
		$player._on_button_left_pressed()
		
	if Input.is_action_just_pressed("ui_right"):
		$player._on_button_right_pressed()
