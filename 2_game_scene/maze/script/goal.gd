extends Area2D
@onready var sound_goal=$sound_goal

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
		# playerが接したときにゴール
	if(body.name=="player"):
		# 音を鳴らす
		sound_goal.play_sound()
		
		# シーンチェンジの関数呼び出し
		get_parent().change_scene()
