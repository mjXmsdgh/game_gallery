extends Node2D

# PointNode は、点を描画する役割を持つノードです。

# world_to_screen ノードへの参照
@onready var wtos_node = get_node_or_null("../../world_to_screen")
# wtos_node は、ワールド座標をスクリーン座標に変換する処理を行う world_to_screen ノードへの参照を保持します。

# ノードがシーンツリーに追加されたときに一度だけ呼ばれる関数
func _ready() -> void:
	"""
	ノードの初期化処理。シーンツリーに追加された時に一度だけ呼び出されます。
	ここでは、再描画を要求しています。
	"""
	queue_redraw()
	# queue_redraw() は、_draw() 関数を呼び出して再描画を要求します。
	# この関数を呼び出すことで、次のフレームで _draw() が実行されます。

# 描画処理を行う関数
func _draw() -> void:
	"""
	点を描画する関数。
	point_managerが保持している点を、world_to_screenノードを通してスクリーン座標に変換し、描画を行います。
	また、各点からx軸、y軸への垂線も描画しています。
	"""
	# 親ノード（point_manager）が保持している点の情報を順番に処理します。
	for point_data in get_parent().points:
		# 各点の色や位置の情報を取得します。
		var point: Vector2 = point_data.pos #点の位置（ワールド座標）を取得します。
		var screen_point: Vector2 = wtos_node.world_to_screen(point) #ワールド座標をスクリーン座標に変換します。
		var point_color: Color = point_data.color #点の色を取得します。

		# x軸への垂線を描画します。
		var v_point = Vector2(point.x, 0) #点のx座標はそのままに、y座標を0にした点を定義します。これはx軸上の点です。
		var v_screen_point = wtos_node.world_to_screen(v_point) #上の点をワールド座標からスクリーン座標に変換します。
		draw_line(screen_point, v_screen_point, Color.DIM_GRAY, 2.0) #スクリーン座標上で、点からx軸へ線を描画します。

		# y軸への垂線を描画します。
		var h_point = Vector2(0, point.y) #点のy座標はそのままに、x座標を0にした点を定義します。これはy軸上の点です。
		var h_screen_point = wtos_node.world_to_screen(h_point) #上の点をワールド座標からスクリーン座標に変換します。
		draw_line(screen_point, h_screen_point, Color.DIM_GRAY, 2.0) #スクリーン座標上で、点からy軸へ線を描画します。

		# 点そのものを描画します。
		draw_circle(screen_point, 5, point_color)
		#draw_circle（Vector2 center, float radius, Color color）は、指定された中心座標、半径、色で円を描画する関数です。
		#ここでは、screen_pointを中心に、半径5の円を、point_colorで描画しています。

# 毎フレーム呼ばれる関数
func _process(delta: float) -> void:
	"""
	毎フレーム実行される関数。
	現状では特に何も処理を行いません。
	"""
	pass
