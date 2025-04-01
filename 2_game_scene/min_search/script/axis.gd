extends Node2D

# 軸の描画を担当するノード

# 軸の描画
func draw_axis():

	var screen_info=get_node_or_null("../ScreenInfo")
	
	# 画面の中心座標を取得します。
	var center: Vector2 = screen_info.get_screen_center()
	
	# 画面のサイズを取得します。
	var screen_size: Vector2 = screen_info.get_screen_size()

	# x軸
	# x軸の開始位置は、画面の左端で、y座標は画面の中心です。
	var x_axis_start: Vector2 = Vector2(0, center.y)
	# x軸の終了位置は、画面の右端で、y座標は画面の中心です。
	var x_axis_end: Vector2 = Vector2(screen_size.x, center.y)
	# x軸を描画します。色は濃い灰色で、太さは5.0です。
	draw_line(x_axis_start, x_axis_end, Color.DIM_GRAY,5.0)

	# y軸
	# y軸の開始位置は、画面の中央で、y座標は画面の上端です。
	var y_axis_start: Vector2 = Vector2(center.x, 0)
	# y軸の終了位置は、画面の中央で、y座標は画面の下端です。
	var y_axis_end: Vector2 = Vector2(center.x, screen_size.y)
	# y軸を描画します。色は濃い灰色で、太さは5.0です。
	draw_line(y_axis_start, y_axis_end, Color.DIM_GRAY,5.0)


# ノードがシーンツリーに追加されたときに呼び出されます。
func _ready():
	# 描画をキューに入れます。つまり、次のフレームで_draw()が実行されます。
	queue_redraw()


# 描画処理。queue_redraw()によって呼び出されます。
func _draw():

	# 軸を描画します。
	draw_axis()
