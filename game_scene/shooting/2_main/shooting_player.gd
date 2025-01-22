extends CharacterBody2D


#const SPEED = 300.0
#const JUMP_VELOCITY = -400.0
const TILE_SIZE=32

func _physics_process(delta: float) -> void:
	# Add the gravity.
	#if not is_on_floor():
	#	velocity += get_gravity() * delta

	# Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
	#	velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	#var direction := Input.get_axis("ui_left", "ui_right")
	#if direction:
	#	velocity.x = direction * SPEED
	#else:
	#	velocity.x = move_toward(velocity.x, 0, SPEED)

	#move_and_slide()
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
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
	if (velocity.x==0)and(velocity.y==0):
		return
	
	# 移動量
	var move_value=velocity*TILE_SIZE
	
	# 新しい位置
	var new_position=position+move_value
	
	# 移動できるかチェック
	if test_move(global_transform,move_value):
		return
	
	# 丸める
	new_position.x=round(new_position.x/TILE_SIZE)*TILE_SIZE
	new_position.y=round(new_position.y/TILE_SIZE)*TILE_SIZE
	
	# 移動
	position=new_position
