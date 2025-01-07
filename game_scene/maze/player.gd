extends CharacterBody2D
const TILE_SIZE=32
@export var speed = TILE_SIZE
@onready var sound_player=get_node("/root/Maze/AudioStreamPlayer2D")
@onready var sound_player_go=get_node("/root/Maze/AudioStreamPlayer2D2")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_just_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_just_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_just_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_just_pressed("ui_up"):
		velocity.y -= 1
		
	if (velocity.x==0)and(velocity.y==0):
		return
	
	# 移動量
	var move_value=velocity*TILE_SIZE
	
	# 新しい位置
	var new_position=position+move_value
	
	
	#var collision=move_and_collide(move_value)
	#if collision :
	#	print("collision detected")
	#	sound_player.play_sound()
	#	return
	
	if test_move(global_transform,move_value):
		sound_player.play_sound()
		return
	
	# 丸める
	new_position.x=round(new_position.x/TILE_SIZE)*TILE_SIZE
	new_position.y=round(new_position.y/TILE_SIZE)*TILE_SIZE
	
	# 移動
	position=new_position
	sound_player_go.play_sound()
	
