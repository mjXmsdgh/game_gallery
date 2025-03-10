extends Node2D

# 描画範囲の定義
var x_min: float = -10.0  # x軸の最小値（左端）
var x_max: float = 10.0   # x軸の最大値（右端）
var y_min: float = -10.0  # y軸の最小値（下端）
var y_max: float = 10.0   # y軸の最大値（上端）
var graph_scale: float = 30.0  # グラフのスケール（拡大率）：グラフ上の1単位が画面上の何ピクセルに相当するか

# 二次関数の係数 (y = ax^2 + bx + c)
var a: float = 1.0  # 二次項の係数 (x^2の係数)
var b: float = 0.0  # 一次項の係数 (xの係数)
var c: float = 0.0  # 定数項

func _ready():
	"""
	シーンが準備完了したときに一度だけ呼ばれる関数。
	ここでは、_draw() メソッドを呼び出して、初期描画を行うように要求する。
	"""
	queue_redraw()  # _draw() メソッドの呼び出しを要求（次のフレームで実行される）

# 画面の幅と高さを取得
func get_screen_size() -> Vector2:
	"""
	現在の画面のサイズ（幅と高さ）を取得する関数。
	Returns:
		Vector2: 画面のサイズを表すVector2オブジェクト（xが幅、yが高さ）
	"""
	var screen_width: float = get_viewport_rect().size.x  # 画面の幅を取得
	var screen_height: float = get_viewport_rect().size.y # 画面の高さを取得

	return Vector2(screen_width, screen_height)  # 画面の幅と高さをVector2として返す

# 画面の中心の座標を取得
func get_screen_center() -> Vector2:
	"""
	現在の画面の中心座標を取得する関数。
	Returns:
		Vector2: 画面の中心座標を表すVector2オブジェクト（x, y）
	"""
	var screen_size: Vector2 = get_screen_size() # 画面のサイズを取得

	# 画面の中心を計算
	var center_position: Vector2 = Vector2(screen_size.x / 2, screen_size.y / 2)

	return center_position  # 画面の中心座標を返す

# ワールド座標をスクリーン座標に変換
func world_to_screen(world_pos: Vector2) -> Vector2:
	"""
	グラフ上の座標（ワールド座標）を、画面上の座標（スクリーン座標）に変換する関数。
	Args:
		world_pos (Vector2): 変換するワールド座標
	Returns:
		Vector2: 変換されたスクリーン座標
	"""
	var center: Vector2 = get_screen_center()  # 画面の中心座標を取得
	# スクリーン座標を計算：
	# x: 画面中心から右方向へ、ワールド座標のx値にスケールをかけた分だけ移動
	# y: 画面中心から下方向へ、ワールド座標のy値にスケールをかけた分だけ移動（上下反転）
	var screen_pos: Vector2 = Vector2(
		center.x + world_pos.x * graph_scale,
		center.y - world_pos.y * graph_scale
	)
	return screen_pos  # スクリーン座標を返す

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

		# 現在のx座標を計算（0.1刻みで）
		var current_x: float = float(x) / 10.0  

		# 現在のx座標に対応するy座標を計算
		var current_y: float = quadratic_function(current_x)  
		
		# 現在の点（ワールド座標）を生成
		var current_point: Vector2 = Vector2(current_x, current_y)  
		
		# 直前の点と現在の点をスクリーン座標に変換
		var screen_previous_point = world_to_screen(previous_point)
		var screen_current_point = world_to_screen(current_point)
		
		# 直前の点から現在の点まで緑色の線を描画
		draw_line(screen_previous_point, screen_current_point, Color.GREEN)

		previous_point = current_point  # 現在の点を次のループの直前の点として保存

# 軸の描画
func draw_axis():
	"""
	x軸とy軸を描画する関数。
	"""

	# 画面の中心を取得
	var center: Vector2 = get_screen_center() 

	# 画面サイズを取得
	var screen_size:Vector2=get_screen_size() 

	# -----x軸の描画-----

	# x軸の始点（左端、画面中心のy座標）
	var x_axis_start: Vector2 = Vector2(0, center.y) 

	# x軸の終点（右端、画面中心のy座標）
	var x_axis_end: Vector2 = Vector2(screen_size.x, center.y) 

	# x軸を白色で描画
	draw_line(x_axis_start, x_axis_end, Color.WHITE) 

	# -----y軸の描画-----

	# y軸の始点（画面中心のx座標、上端）
	var y_axis_start:Vector2=Vector2(center.x,0) 

	# y軸の終点（画面中心のx座標、下端）
	var y_axis_end:Vector2=Vector2(center.x,screen_size.y) 

	# y軸を白色で描画
	draw_line(y_axis_start,y_axis_end,Color.WHITE) 

# 描画処理
func _draw():
	"""
	このノードの描画を行うために呼ばれる関数。
	queue_redraw() が呼び出された次のフレームで実行される。
	"""
	# 軸を描画
	draw_axis()  
	
	# 二次関数を描画
	draw_quadratic_function()  
