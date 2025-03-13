extends Node2D

# Axisノードへの参照
@onready var wtos_node=get_parent().get_parent().get_node_or_null("world_to_screen")
#@onready var point_manager=get_parent()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	queue_redraw()

	#point_manager.add_point({"pos":Vector2(1,2),"color":Color.RED})
	#point_manager.add_point({"pos":Vector2(-2,4),"color":Color.BLUE})
	#point_manager.add_point({"pos":Vector2(0,0),"color":Color.GREEN})


func draw_one_point(point_data: Dictionary):
	"""
	点を描画する関数
	"""
	#var point: Vector2=Vector2(1,2)
	var point: Vector2=Vector2(point_data.pos)
	var screen_point=wtos_node.world_to_screen(point)
	var point_color: Color=point_data.color

	# x軸への垂線
	var v_point=Vector2(point.x,0)
	var v_screen_point=wtos_node.world_to_screen(v_point)
	draw_line(screen_point,v_screen_point,Color.DIM_GRAY,2.0)

	# y軸への垂線
	var h_point=Vector2(0,point.y)
	var h_screen_point=wtos_node.world_to_screen(h_point)
	draw_line(screen_point,h_screen_point,Color.DIM_GRAY,2.0)

	# 点
	draw_circle(screen_point,5,point_color)

func _draw() -> void:

	for point_data in get_parent().points:
		draw_one_point(point_data)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
