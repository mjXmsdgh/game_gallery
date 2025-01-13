extends CharacterBody2D
const TILE_SIZE=32
@onready var sound_go=$sound_go
@onready var sound_stop=$sound_stop

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func init():
	position=Vector2(0,32)

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
		sound_stop.play_sound()
		return
	
	# 丸める
	new_position.x=round(new_position.x/TILE_SIZE)*TILE_SIZE
	new_position.y=round(new_position.y/TILE_SIZE)*TILE_SIZE
	
	# 移動
	position=new_position
	sound_go.play_sound()	
