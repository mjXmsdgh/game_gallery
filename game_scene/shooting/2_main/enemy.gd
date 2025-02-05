extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_entered(area: Area2D) -> void:
	# 弾が当たったので弾を消して自分も消える
	area.delete()
	queue_free()
	print("get score")
	
	# Mainノードを取得
	var Main_node=get_tree().root.get_child(1)
	
	Main_node.add_score(100)
	
