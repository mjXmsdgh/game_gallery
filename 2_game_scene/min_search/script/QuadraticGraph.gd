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


@onready var wtos_node=get_parent().get_node_or_null("world_to_screen")
@onready var point_manager=get_parent().get_node_or_null("PointManager") # PointManager を取得

# 二次関数の計算
func quadratic_function(x: float) -> float:
	"""
	二次関数 y = ax^2 + bx + c の値を計算する関数。
	Args:
		x (float): x軸の値
	Returns:
		float: xに対応するyの値
	"""

	# 二次関数の係数 (y = ax^2 + bx + c)
	var a: float = 1.0  # 二次項の係数 (x^2の係数): 二次関数のx^2項の係数
	var b: float = 0.0  # 一次項の係数 (xの係数): 二次関数のx項の係数
	var c: float = 0.0  # 定数項: 二次関数の定数項

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
		var screen_previous_point: Vector2 = wtos_node.world_to_screen(previous_point)
		var screen_current_point: Vector2 = wtos_node.world_to_screen(current_point)

		# 直前の点から現在の点まで緑色の線を描画
		draw_line(screen_previous_point, screen_current_point, Color.WHITE,3.0)

		previous_point = current_point  # 現在の点を次のループの直前の点として保存

func _ready():
	"""
	シーンが準備完了したときに一度だけ呼ばれる関数。
	ここでは、親ノードであるAxisNodeが取得できているか確認して、_draw() メソッドを呼び出して、初期描画を行うように要求する。
	"""
	queue_redraw()  # _draw() メソッドの呼び出しを要求（次のフレームで実行される）

	point_manager.add_point({"pos": Vector2(-3, quadratic_function(-3)), "color": Color.RED})
	point_manager.add_point({"pos": Vector2(0, quadratic_function(0)), "color": Color.BLUE})
	point_manager.add_point({"pos": Vector2(3, quadratic_function(3)), "color": Color.GREEN})


# 描画処理
func _draw():
	"""
	このノードの描画を行うために呼ばれる関数。
	queue_redraw() が呼び出された次のフレームで実行される。
	"""
	draw_quadratic_function()  # 二次関数を描画
