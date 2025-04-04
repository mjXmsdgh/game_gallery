extends Node2D

# Axisノードへの参照
@onready var axis_node: Node2D = get_node_or_null("../../XyAxis/AxisNode") as Node2D

@onready var screen_info: Node2D =get_node_or_null("../../XyAxis/ScreenInfo")

@onready var axis_range: Node2D =get_node_or_null("../../XyAxis/AxisRange")

# ワールド座標をスクリーン座標に変換
func world_to_screen(world_pos: Vector2) -> Vector2:
	"""
	グラフ上の座標（ワールド座標）を、画面上の座標（スクリーン座標）に変換する関数。
	Args:
		world_pos (Vector2): 変換するワールド座標
	Returns:
		Vector2: 変換されたスクリーン座標
	"""
	if axis_node == null:
		push_error("Error: parent axis node not found")
		return Vector2.ZERO

	var center: Vector2 = screen_info.get_screen_center()
	var screen_size: Vector2 = screen_info.get_screen_size()
	
	# ここでAxisNodeのx_min,x_max等を取得する必要がある。ただしそれはAxisNodeの責務
	var x_min: float = axis_range.get_x_min()
	var x_max: float = axis_range.get_x_max()
	var y_min: float = axis_range.get_y_min()
	var y_max: float = axis_range.get_y_max()
	var world_width: float = x_max - x_min
	var world_height: float = y_max - y_min
	var screen_width: float = screen_size.x
	var screen_height: float = screen_size.y

	var world_center_x=(x_max + x_min) / 2
	var world_center_y=(y_max + y_min) / 2

	var scale_x=screen_width / world_width
	var scale_y=screen_height / world_height

	var screen_x: float = center.x + (world_pos.x - world_center_x) * scale_x
	var screen_y: float = center.y - (world_pos.y - world_center_y) * scale_y

	return Vector2(screen_x, screen_y)
