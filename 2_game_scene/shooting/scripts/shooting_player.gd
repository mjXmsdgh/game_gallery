extends CharacterBody2D


@export var BulletScene: PackedScene

const TILE_SIZE:int=32


func move(velocity: Vector2) -> void:
	
	# 移動しない
	if velocity.is_zero_approx():
		return
	
	# 移動量
	var move_value:Vector2=velocity*TILE_SIZE
	
	# 新しい位置
	var new_position:Vector2=position+move_value
	
	# 移動できるかチェック
	if test_move(global_transform,move_value):
		return
	
	# 丸める
	new_position.x=round(new_position.x/TILE_SIZE)*TILE_SIZE
	new_position.y=round(new_position.y/TILE_SIZE)*TILE_SIZE
	
	# 移動
	position=new_position


func shoot() -> void:
	
	$AudioStreamPlayer2D.play()
	
	var bullet_instance:Node2D=BulletScene.instantiate()
	
	if bullet_instance==null:
		print("error")
		return
		
	# 位置を設定
	bullet_instance.position=position
	bullet_instance.position.y=bullet_instance.position.y-TILE_SIZE
	
	
	# 追加
	get_parent().add_child(bullet_instance)
	

func _on_button_up_pressed() -> void:
	var velocity=Vector2(0,-1)
	self.move(velocity)


func _on_button_down_pressed() -> void:
	var velocity=Vector2(0,1)
	self.move(velocity)


func _on_button_left_pressed() -> void:
	var velocity=Vector2(-1,0)
	self.move(velocity)


func _on_button_right_pressed() -> void:
	var velocity=Vector2(+1,0)
	self.move(velocity)


func _on_button_shoot_pressed() -> void:
	self.shoot()
