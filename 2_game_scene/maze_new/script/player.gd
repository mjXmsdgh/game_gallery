extends CharacterBody2D
const TILE_SIZE=32

#const SPEED = 300.0
#const JUMP_VELOCITY = -400.0
@onready var sound_go=$sound_go
@onready var sound_stop=$sound_stop

func _process(delta: float) -> void:
	var velocity = Vector2.ZERO # The player's movement vector.
	
	# キー入力
	if Input.is_action_just_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_just_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_just_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_just_pressed("ui_up"):
		velocity.y -= 1

	# 入力なし
	if velocity==Vector2.ZERO:
		return

	# 移動量を計算
	var move_value=	velocity*TILE_SIZE

	# 移動チェック	
	if test_move(global_transform,move_value):
		sound_stop.play_sound()
		return

	# 新しい位置
	var new_position = position+move_value
		
	# 新しい位置をタイルのグリッドに合わせて丸める
	new_position.x = round(new_position.x / TILE_SIZE) * TILE_SIZE
	new_position.y = round(new_position.y / TILE_SIZE) * TILE_SIZE
	
	position=new_position
	sound_go.play_sound()
