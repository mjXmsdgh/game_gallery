extends Node2D

# CalculationNodeへの参照
var calculation_node: Node2D=null
# PointManagerへの参照
var point_manager_node: Node2D=null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	calculation_node = get_node_or_null("./Calculation_AN")
	point_manager_node = get_node_or_null("./Data/PointManager")

	if calculation_node==null:
		push_error("Error: CalculationNode not found.")
		return

	if point_manager_node==null:
		push_error("Error:  PointManager not found.")
		return


func _input(event: InputEvent) -> void:
	"""
	キー入力を処理する関数。
	スペースキーが押されたら、step_forward()を呼び出す。
	"""
	if event is InputEventKey:  # eventがInputEventKeyのときのみ処理する
		if event.is_pressed() and event.keycode == KEY_SPACE: #スペースキーが押されているか確認
			if calculation_node:
				var value=calculation_node.step_forward()
				print(value)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
