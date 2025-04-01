extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# 画面の幅と高さを取得
func get_screen_size() -> Vector2:
	
	# ビューポート（画面）の矩形領域のサイズを取得します。
	var screen_width: float = get_viewport_rect().size.x
	var screen_height: float = get_viewport_rect().size.y
	
	return Vector2(screen_width, screen_height)

# 画面の中心の座標を取得
func get_screen_center() -> Vector2:
	
	# 画面のサイズを取得します。
	var screen_size: Vector2 = get_screen_size()
	
	# 画面の中心座標を計算します。
	var center_position: Vector2 = Vector2(screen_size.x / 2, screen_size.y / 2)
	
	return center_position
