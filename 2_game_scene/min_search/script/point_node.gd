extends Node2D


# Axisノードへの参照
@onready var axis_node = get_parent()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


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
	var screen_size = axis_node.get_screen_size()
	# ここでAxisNodeのx_min,x_max等を取得する必要がある。ただしそれはAxisNodeの責務
	var x_min = -10.0
	var x_max = 10.0
	var y_min = -10.0
	var y_max = 10.0
	var world_width = x_max - x_min
	var world_height = y_max - y_min
	var screen_width = screen_size.x
	var screen_height = screen_size.y

	var screen_x = center.x + (world_pos.x - ((x_max + x_min) / 2)) * (screen_width / world_width)
	var screen_y = center.y - (world_pos.y - ((y_max + y_min) / 2)) * (screen_height / world_height)

	return Vector2(screen_x, screen_y)

func draw_one_point():
	"""
	点を描画する関数
	"""
	var point: Vector2=Vector2(1,2)

	var screen_point=world_to_screen(point)
	draw_circle(screen_point,5,Color.RED)

func _draw() -> void:

	draw_one_point()



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:

	pass
