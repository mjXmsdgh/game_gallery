extends Area2D

signal goal_signal

# 弾のグループ名
const BULLET_GROUP = "bullet"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_entered(area: Area2D) -> void:
	# 侵入してきたareaが弾グループならsignal発信
	if area.is_in_group(BULLET_GROUP):

		# 音を鳴らす
		$goal_sound.play()

func _on_goal_sound_finished() -> void:

	# 音がなり終わったらシグナル発信
	emit_signal("goal_signal")
