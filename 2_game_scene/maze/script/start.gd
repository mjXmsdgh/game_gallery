extends Node2D

const SIGNAL_CHANGE_TO_MAIN = "change_to_main"
signal change_to_main

func _on_button_start_pressed() -> void:
	emit_signal(SIGNAL_CHANGE_TO_MAIN)
