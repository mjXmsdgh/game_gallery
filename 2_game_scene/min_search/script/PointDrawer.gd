extends Node2D

# PointNode は、点を描画する役割を持つノードです。

@onready var wtos_node: Node2D=get_node_or_null("../world_to_screen")
@onready var point_manager: Node2D=get_node_or_null("../../Data/PointManager")


# ノードがシーンツリーに追加されたときに一度だけ呼ばれる関数
func _ready() -> void:
	"""
	ノードの初期化処理。シーンツリーに追加された時に一度だけ呼び出されます。
	ここでは、再描画を要求しています。
	"""
	point_manager.points_changed.connect(_on_points_changed)
	queue_redraw()


# 描画処理を行う関数
func _draw() -> void:
	"""
	点を描画する関数。
	point_managerが保持している点を、world_to_screenノードを通してスクリーン座標に変換し、描画を行います。
	また、各点からx軸、y軸への垂線も描画しています。
	"""
	# PointManagerから点のデータを取得
	var points: Array[Dictionary] = point_manager.get_points()

	# 親ノード（point_manager）が保持している点の情報を順番に処理します。
	for point_data in point_manager.points:

		# 描画する点
		var point: Vector2 = point_data.pos 
		var screen_point: Vector2 = wtos_node.world_to_screen(point) 
		var point_color: Color = point_data.color

		# x軸への垂線   screen_pointとv_screen_point
		var v_point = Vector2(point.x, 0) 
		var v_screen_point = wtos_node.world_to_screen(v_point) 
		draw_line(screen_point, v_screen_point, Color.DIM_GRAY, 2.0) 
 
		# y軸への垂線 screen_pointとh_screen_point
		var h_point = Vector2(0, point.y) 
		var h_screen_point = wtos_node.world_to_screen(h_point)
		draw_line(screen_point, h_screen_point, Color.DIM_GRAY, 2.0) 

		# 点そのものを描画します。  位置、半径、色
		draw_circle(screen_point, 5, point_color)

		#指定した点を描画
		var world_origin=Vector2(0,0)
		var screen_origin=wtos_node.world_to_screen(world_origin)
		draw_circle(screen_origin,5,Color.BLUE)


# 点が変更されたときに呼び出される
func _on_points_changed():
	queue_redraw()


# 毎フレーム呼ばれる関数
func _process(delta: float) -> void:
	"""
	毎フレーム実行される関数。
	現状では特に何も処理を行いません。
	"""
	pass
