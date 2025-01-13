extends Node2D

@onready var time_label=$timer_label
var start_time=0
var elapsed_time=0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	start_time=Time.get_ticks_msec()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	elapsed_time=(Time.get_ticks_msec()-start_time)/1000.0

	# 時分秒
	var hours=int(elapsed_time/3600)
	var minutes=int(fmod(elapsed_time,3600)/60.0)
	var seconds=int(fmod(elapsed_time,3600))
	
	# 更新
	time_label.text="Time: %02d:%02d:%02d" % [hours,minutes,seconds]
	
func restart():
	print("restart")
	
	# リザルト画面に
	get_tree().change_scene_to_file("res://game_scene/maze/3_end/End.tscn")
	
	
