extends Node2D

@onready var time_label=$timer_label
@export var end_scene:PackedScene
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
	
	Grobal.clear_time=str(hours)+":"+str(minutes)+":"+str(seconds)
	# 更新
	time_label.text="Time: %02d:%02d:%02d" % [hours,minutes,seconds]
	
func restart():
	print("restart")
	
	# シーン変更を遅延させる
	call_deferred("change_scene")
	
func change_scene():

	# mazeを実体化
	var end_instance:Node=end_scene.instantiate()

	# 子ノードに追加
	var root:Node=get_tree().get_root()
	root.add_child(end_instance)

	# 終わったら開放
	get_tree().current_scene.queue_free()	
