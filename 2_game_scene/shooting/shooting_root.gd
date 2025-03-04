extends Node2D

enum SceneName {START, MAIN, END}
const SIGNAL_CHANGE_TO_MAIN = "change_to_main"
const SIGNAL_MAIN_TO_END = "main_to_end"
const SIGNAL_END_TO_START = "end_to_start"

const StartScene: PackedScene = preload("res://2_game_scene/shooting/1_start/start.tscn")
const MainScene: PackedScene = preload("res://2_game_scene/shooting/2_main/main.tscn")
#const EndScene: PackedScene = preload("")


func _ready() -> void:
	_change_scene(SceneName.START)
	

func _process(delta: float) -> void:
	pass

func _change_scene(scene_name:SceneName) -> void:
	if current_scene != null:
		current_scene.queue_free()
		current_scene = null
	
	match scene_name:
		SceneName.START:
			if StartScene == null: # 修正箇所: nullかどうかをチェック
				printerr("Error: Start scene is not loaded.")
				return
			current_scene = StartScene.instantiate()
			current_scene.connect(SIGNAL_CHANGE_TO_MAIN, _on_start_to_main)
		SceneName.MAIN:
			if MainScene == null: # 修正箇所: nullかどうかをチェック
				printerr("Error: Main scene is not loaded.")
				return
			current_scene = MainScene.instantiate()
			current_scene.connect(SIGNAL_MAIN_TO_END, _on_main_to_end)
		SceneName.END:
			if EndScene == null: # 修正箇所: nullかどうかをチェック
				printerr("Error: End scene is not loaded.")
				return
			current_scene = EndScene.instantiate()
			current_scene.connect(SIGNAL_END_TO_START, _on_end_to_start)
		_:
			printerr("Error: Invalid scene name.")
			return
	
	add_child(current_scene)


func _on_start_to_main() -> void:
	_change_scene(SceneName.MAIN)

func _on_main_to_end() -> void:
	_change_scene(SceneName.END)

func _on_end_to_start() -> void:
	_change_scene(SceneName.START)
