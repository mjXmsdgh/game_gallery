extends Node2D

# メインシーンに切り替えるための信号
signal change_to_main


# シーンがシーンツリーに入ったときに一度だけ呼ばれる
func _ready() -> void:
	pass # Replace with function body.

# スタートボタンが押されたときに呼び出される
func _on_button_start_pressed() -> void:

	# メインシーンへの切り替えを知らせる信号を発する
	emit_signal("change_to_main")
