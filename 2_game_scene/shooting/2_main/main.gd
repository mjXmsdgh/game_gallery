extends Node2D

# エンドシーンへ切り替えるための信号
signal main_to_end


var time:float=0.0  # 経過時間
var score:int=0     # 現在のスコア 

const ENEMY_SCORE:int = 100 # 敵を倒した時のスコア
const ONE_SECOND:float = 1.0 # 1秒


# Called when the node enters the scene tree for the first time.
func _ready() -> void:

	# スコア表示を初期化する
	update_score()

	# enemy ノードのシグナルを接続する
	connect_enemy_signals()
	
	# ゴールのシグナルを接続
	$Goal_flag.connect("goal_signal",_on_goal_reached)


func update_score() -> void:

	# CanvasLayer 内の ScoreLabel のテキストを、現在のスコアに更新する
	$CanvasLayer/ScoreLabel.text=str(score)


func connect_enemy_signals() -> void:

	# "enemy" グループに属するすべてのノードを取得する（複数の敵が存在する場合を想定）
	var enemys:Array[Node]=get_tree().get_nodes_in_group("enemy")

	# 取得した各 enemy ノードに対して処理を行う
	for enemy in enemys:

		# 各 enemy ノードの "enemy_deleted" シグナルを、このスクリプトの "_on_enemy_deleted" 関数に接続する
		enemy.connect("enemy_deleted",_on_enemy_deleted)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:

	_handle_player_input()
		
	# 時間計測：delta を time に加算する（経過時間を記録）
	time=time+delta
	
	# 1 秒経過したか判定
	if time>=ONE_SECOND:

		# 1秒ごとにプレイヤーが上方向に移動するようにする
		$player._on_button_up_pressed()

		# time をリセット
		time=0


func _handle_player_input() -> void:
	if Input.is_action_just_pressed("ui_up"):
		$player._on_button_up_pressed()
	if Input.is_action_just_pressed("ui_down"):
		$player._on_button_down_pressed()
	if Input.is_action_just_pressed("ui_left"):
		$player._on_button_left_pressed()
	if Input.is_action_just_pressed("ui_right"):
		$player._on_button_right_pressed()
	if Input.is_action_just_pressed("key_space"):
		$player.shoot()

func _on_enemy_deleted()->void:

	# スコア追加
	add_score(ENEMY_SCORE)


func add_score(input_score: int) -> void:

	# 現在のスコアに、引数として渡されたスコアを加算する
	score=score+input_score

	# スコア表示を更新する
	update_score()

func _on_goal_reached() -> void:
	print("get goal")
	emit_signal("main_to_end")
