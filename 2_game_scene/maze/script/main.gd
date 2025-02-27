extends Node2D

const SIGNAL_MAIN_TO_END = "main_to_end"
signal main_to_end

var start_time:float=Time.get_ticks_msec()
var elapsed_time:float

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Label_timer.text="0"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	elapsed_time=Time.get_ticks_msec()-start_time
	elapsed_time=elapsed_time/1000.0
	$Label_timer.text=str(elapsed_time)


func change_scene()->void:
	elapsed_time=Time.get_ticks_msec()-start_time
	
	var sec=elapsed_time/1000.0
	Global.set_time(str(sec))
	
	emit_signal(SIGNAL_MAIN_TO_END) # 修正箇所: シグナル名を文字列として渡す
