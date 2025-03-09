extends Node2D

@onready var mesh_instance: MeshInstance2D = $MeshInstance2D

# 二次関数: y = ax^2 + bx + c
var a: float = 1.0
var b: float = 0.0
var c: float = 0.0

# 描画範囲
var x_min: float = -10.0
var x_max: float = 10.0
var step: float = 0.1  # 刻み幅

func _ready():
	draw_graph()

func draw_graph():
	var surface_tool: SurfaceTool = SurfaceTool.new()

	# 折れ線に設定
	surface_tool.begin(Mesh.PRIMITIVE_LINE_STRIP)

	# 頂点を追加する
	for x in range(int((x_max - x_min) / step) + 1):
		var real_x: float = x_min + x * step
		var y: float = a * pow(real_x, 2) + b * real_x + c  # 二次関数の計算

		# 画面に表示するため座標を調整
		var display_x: float = real_x * 30.0 + (get_viewport_rect().size.x/2) # 30.0を乗算し、見えやすいように調整
		var display_y: float = -y * 30.0 + (get_viewport_rect().size.y/2) # yは反転させて表示

		surface_tool.add_vertex(Vector3(display_x, display_y, 0.0))

	# 法線を生成
	surface_tool.generate_normals()

	# コミット
	var mesh: Mesh = surface_tool.commit()

	# メッシュを設定
	mesh_instance.mesh = mesh
