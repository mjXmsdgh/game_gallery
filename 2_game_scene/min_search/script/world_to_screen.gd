extends Node2D

# Axisノードへの参照
@onready var axis_node: Node2D = get_node_or_null("../../AxisNode") as Node2D

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
		print_debug("Error: parent axis node not found")
		return Vector2.ZERO

	var center: Vector2 = axis_node.get_screen_center()
	var screen_size: Vector2 = axis_node.get_screen_size()
	
	# ここでAxisNodeのx_min,x_max等を取得する必要がある。ただしそれはAxisNodeの責務
	var x_min: float = axis_node.get_x_min()
	var x_max: float = axis_node.get_x_max()
	var y_min: float = axis_node.get_y_min()
	var y_max: float = axis_node.get_y_max()
	var world_width: float = x_max - x_min
	var world_height: float = y_max - y_min
	var screen_width: float = screen_size.x
	var screen_height: float = screen_size.y

	var screen_x: float = center.x + (world_pos.x - ((x_max + x_min) / 2)) * (screen_width / world_width)
	var screen_y: float = center.y - (world_pos.y - ((y_max + y_min) / 2)) * (screen_height / world_height)

	return Vector2(screen_x, screen_y)
