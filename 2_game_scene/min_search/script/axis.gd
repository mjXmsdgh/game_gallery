extends Node2D

# 軸の描画を担当するノード

# 画面の幅と高さを取得
func get_screen_size() -> Vector2:
	var screen_width: float = get_viewport_rect().size.x
	var screen_height: float = get_viewport_rect().size.y
	return Vector2(screen_width, screen_height)

# 画面の中心の座標を取得
func get_screen_center() -> Vector2:
	var screen_size: Vector2 = get_screen_size()
	var center_position: Vector2 = Vector2(screen_size.x / 2, screen_size.y / 2)
	return center_position

# 軸の描画
func draw_axis():
	var center: Vector2 = get_screen_center()
	var screen_size: Vector2 = get_screen_size()

	# x軸
	var x_axis_start: Vector2 = Vector2(0, center.y)
	var x_axis_end: Vector2 = Vector2(screen_size.x, center.y)
	draw_line(x_axis_start, x_axis_end, Color.DIM_GRAY,5.0)

	# y軸
	var y_axis_start: Vector2 = Vector2(center.x, 0)
	var y_axis_end: Vector2 = Vector2(center.x, screen_size.y)
	draw_line(y_axis_start, y_axis_end, Color.DIM_GRAY,5.0)

func _ready():
	queue_redraw()

# 描画処理
func _draw():
	draw_axis()
