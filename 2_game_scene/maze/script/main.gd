extends Node2D

@export var scene_path:String="res://2_game_scene/maze/scene/end.tscn"
signal main_to_end

var start_time:int=Time.get_ticks_msec()
var elapsed_time:int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Label_timer.text="0"
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	elapsed_time=Time.get_ticks_msec()-start_time
	elapsed_time=elapsed_time/1000.0
	$Label_timer.text=str(elapsed_time)


func change_scene()->void:
	elapsed_time=Time.get_ticks_msec()-start_time
	
	var sec=elapsed_time/1000.0
	Global.set_time((str(sec)))
	
	emit_signal("main_to_end")
	#call_deferred("change_scene_deferred")
	
	
func change_scene_deferred():
	
	# secに変換
	var sec=elapsed_time/1000.0

	# クリアタイムを設定
	Global.set_time(str(sec))

	# 終了画面に変更
	get_tree().change_scene_to_file(scene_path)
