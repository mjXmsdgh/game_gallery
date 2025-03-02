extends Area2D

signal enemy_deleted

# Called when the node enters the scene tree for the first time.
func _ready() -> void:

	# グループに追加
	add_to_group("enemy")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_entered(area: Area2D) -> void:

	# 弾が当たったので弾を消して自分も消える
	area.destroy()
	
	# シグナル発信
	emit_signal("enemy_deleted")

	# 自分を解放
	queue_free()
