extends Node2D

const SIGNAL_END_TO_START = "end_to_start"
signal end_to_start

func _ready() -> void:
	$clear_time.text="Clear Time :"+Global.get_time()

func _on_button_go_to_start_pressed():
	emit_signal(SIGNAL_END_TO_START)
