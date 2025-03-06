extends Node2D

# シーン名を列挙型で定義
enum SceneName {START, MAIN, END}

const SIGNAL_CHANGE_TO_MAIN = "change_to_main"
const SIGNAL_MAIN_TO_END = "main_to_end"
const SIGNAL_END_TO_START = "end_to_start"

# シーンをプリロード
const StartScene: PackedScene = preload("res://2_game_scene/shooting/scenes/start.tscn")
const MainScene: PackedScene = preload("res://2_game_scene/shooting/scenes/main.tscn")
const EndScene: PackedScene = preload("res://2_game_scene/shooting/scenes/end.tscn")

# スコア
var clear_score:int=0

# 現在のシーンを管理する変数
var current_scene: Node2D = null

func _ready() -> void:
	# ゲーム開始時にスタートシーンを読み込む
	_change_scene(SceneName.START)


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
			current_scene.connect("send_score_to_root",_on_score_recieved)
		SceneName.END:
			if EndScene == null: # 修正箇所: nullかどうかをチェック
				printerr("Error: End scene is not loaded.")
				return
			current_scene = EndScene.instantiate()
			current_scene.init_score(clear_score)
			current_scene.connect(SIGNAL_END_TO_START, _on_end_to_start)
		_:
			printerr("Error: Invalid scene name.")
			return
	
	add_child(current_scene)


# スコアを受け取ったときに呼び出される関数
func _on_score_recieved(score_value:int)->void:
	clear_score=score_value


# スタートシーンからメインシーンに切り替えるための関数
func _on_start_to_main() -> void:
	_change_scene(SceneName.MAIN)


# メインシーンからエンドシーンに切り替えるための関数
func _on_main_to_end() -> void:
	_change_scene(SceneName.END)


# エンドシーンからスタートシーンに切り替えるための関数
func _on_end_to_start() -> void:
	_change_scene(SceneName.START)
