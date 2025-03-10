extends Node2D

# 二次関数のグラフの描画を担当するノード
# このノードは、y = ax^2 + bx + c の形式の二次関数を描画します。
# このノードはAxisNodeの子ノードとして存在することが想定されています。

# 描画範囲の定義
var x_min: float = -10.0  # x軸の最小値（左端）: グラフが描画されるx軸の最小値
var x_max: float = 10.0   # x軸の最大値（右端）: グラフが描画されるx軸の最大値
var y_min: float = -10.0  # y軸の最小値（下端）: グラフが描画されるy軸の最小値
var y_max: float = 10.0   # y軸の最大値（上端）: グラフが描画されるy軸の最大値
var graph_scale: float = 30.0  # グラフのスケール（拡大率）：グラフ上の1単位が画面上の何ピクセルに相当するか

# 二次関数の係数 (y = ax^2 + bx + c)
var a: float = 1.0  # 二次項の係数 (x^2の係数): 二次関数のx^2項の係数
var b: float = 0.0  # 一次項の係数 (xの係数): 二次関数のx項の係数
var c: float = 0.0  # 定数項: 二次関数の定数項

#  Axisノードのリファレンス
# このノードの親ノードであるAxisノードへの参照を保持する変数
@onready var axis_node=get_parent()

# ワールド座標をスクリーン座標に変換
func world_to_screen(world_pos: Vector2) -> Vector2:
	"""
	グラフ上の座標（ワールド座標）を、画面上の座標（スクリーン座標）に変換する関数。
	Args:
		world_pos (Vector2): 変換するワールド座標
	Returns:
		Vector2: 変換されたスクリーン座標
	"""
	# axis_node が有効なときのみ実行
	if axis_node != null:
		var center: Vector2 = axis_node.get_screen_center() # Axisノードから画面の中心座標を取得
		var screen_size = axis_node.get_screen_size() # Axisノードから画面のサイズを取得
		var world_width = x_max - x_min # ワールド座標の幅
		var world_height = y_max - y_min # ワールド座標の高さ
		var screen_width = screen_size.x # スクリーン座標の幅
		var screen_height = screen_size.y # スクリーン座標の高さ

		# ワールド座標をスクリーン座標に変換する計算
		var screen_x = center.x + (world_pos.x-((x_max+x_min)/2)) * screen_width / world_width; # x座標の変換
		var screen_y = center.y - (world_pos.y-((y_max+y_min)/2)) * screen_height / world_height; # y座標の変換
		return Vector2(screen_x,screen_y) # スクリーン座標を返す
	else:
		return Vector2.ZERO # axis_nodeがnullの場合は原点を返す

# 二次関数の計算
func quadratic_function(x: float) -> float:
	"""
	二次関数 y = ax^2 + bx + c の値を計算する関数。
	Args:
		x (float): x軸の値
	Returns:
		float: xに対応するyの値
	"""
	return a * pow(x, 2) + b * x + c  # 二次関数の計算結果を返す

# 二次関数の描画
func draw_quadratic_function():
	"""
	二次関数のグラフを描画する関数。
	"""
	var previous_point: Vector2 = Vector2(x_min, quadratic_function(x_min))  # 最初の点を設定 (x_minにおけるyの値)
	# x_minからx_maxまでxを細かく刻んでループ
	for x in range(int(x_min * 10), int(x_max * 10)): #xを細かく刻む
		var current_x: float = float(x) / 10.0  # 現在のx座標を計算（0.1刻みで）
		var current_y: float = quadratic_function(current_x)  # 現在のx座標に対応するy座標を計算
		var current_point: Vector2 = Vector2(current_x, current_y)  # 現在の点（ワールド座標）を生成
		
		# 直前の点と現在の点をスクリーン座標に変換
		var screen_previous_point = world_to_screen(previous_point)
		var screen_current_point = world_to_screen(current_point)
		# 直前の点から現在の点まで緑色の線を描画
		draw_line(screen_previous_point, screen_current_point, Color.GREEN)

		previous_point = current_point  # 現在の点を次のループの直前の点として保存

func _ready():
	"""
	シーンが準備完了したときに一度だけ呼ばれる関数。
	ここでは、親ノードであるAxisNodeが取得できているか確認して、_draw() メソッドを呼び出して、初期描画を行うように要求する。
	"""
	print(axis_node)  # axis_nodeの内容をコンソールに出力する（デバッグ用）
	queue_redraw()  # _draw() メソッドの呼び出しを要求（次のフレームで実行される）

# 描画処理
func _draw():
	"""
	このノードの描画を行うために呼ばれる関数。
	queue_redraw() が呼び出された次のフレームで実行される。
	"""
	draw_quadratic_function()  # 二次関数を描画
