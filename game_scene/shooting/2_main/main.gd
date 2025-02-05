extends Node2D

var time=0
var score=0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if Input.is_action_just_pressed("ui_up"):
		$player._on_button_up_pressed()
	elif Input.is_action_just_pressed("ui_down"):
		$player._on_button_down_pressed()
	elif Input.is_action_just_pressed("ui_left"):
		$player._on_button_left_pressed()
	elif Input.is_action_just_pressed("ui_right"):
		$player._on_button_right_pressed()
	elif Input.is_action_just_pressed("key_space"):
		$player.shoot()
		print(score)
		
	time=time+delta
	
	if time>=1.0:
		$player._on_button_up_pressed()
		time=0
		
func add_score(input_score: int) -> void:
	score=score+input_score
