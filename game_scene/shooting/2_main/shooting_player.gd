extends CharacterBody2D
var BulletScene=preload("res://game_scene/shooting/2_main/bullet.tscn")

const TILE_SIZE=32


func move(velocity: Vector2) -> void:
	
	# 移動しない
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


func shoot() -> void:
	print("shoot")
	var bullet_instance=BulletScene.instantiate()
	
	if bullet_instance==null:
		print("error")
		return

	bullet_instance.position=Vector2(0,0)
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
