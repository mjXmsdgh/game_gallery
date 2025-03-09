extends Node2D

# 描画範囲
var x_min: float = -10.0
var x_max: float = 10.0
var y_min: float = -10.0
var y_max: float = 10.0
var graph_scale: float = 30.0  # スケール (名前を変更)

var default_font: Font  # フォントを格納する変数

func _ready():
	queue_redraw()  # _draw() メソッドを呼び出す

# 画面の幅と高さを取得
func get_screen_size() -> Vector2:
	var screen_width: float = get_viewport_rect().size.x  # 画面の幅
	var screen_height: float = get_viewport_rect().size.y # 画面の高さ

	return Vector2(screen_width, screen_height)

# 画面の中心の座標を取得
func get_screen_center() -> Vector2:
	var screen_size: Vector2 = get_screen_size() # 画面のサイズを取得

	# 画面の中心
	var center_position: Vector2 = Vector2(screen_size.x / 2, screen_size.y / 2)

	return center_position

# 軸の描画
func _draw():
	var center: Vector2 = get_screen_center() # 画面の中心を取得

	# x軸
	var x_axis_start: Vector2 = Vector2(0, center.y) # x軸の始点
	var x_axis_end: Vector2 = Vector2(get_screen_size().x, center.y) # x軸の終点
	draw_line(x_axis_start, x_axis_end, Color.WHITE) # x軸の描画

	# y軸
	var y_axis_start:Vector2=Vector2(center.x,0)
	var y_axis_end:Vector2=Vector2(center.x,get_viewport_rect().size.y)
	draw_line(y_axis_start,y_axis_end,Color.WHITE)