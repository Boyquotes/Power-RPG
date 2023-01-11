extends TileMap

export var 长 = 10
export var 宽 = 10

onready var map_data = []
onready var line = $"../Line2D"

var astar = AStar2D.new()
var cell_map = {}
var cells: Dictionary = {}
var altitude: Dictionary = {}
var 图块索引字典: Dictionary = {}

func _ready():
	set_process_input(false)
	born_map()
	connect_astar()
	场景替换图块()
	存图块索引()
	set_process_input(true)

# ========= 得到路径点 ==========
func 得到路径点(from: Vector2, to: Vector2) -> Array:
	# 把世界坐标转换为 Tilemap 坐标
	from = world_to_map(from)
	to = world_to_map(to)
	# cell_map 是一个字典
	# get_point_path 找到起点（from）和终点（to）之间的路径点
	var path: PoolVector2Array = astar.get_point_path(cell_map[from], cell_map[to])
	var result: Array = []
	for cell in path:
		# map_to_world 获取单元格左上角坐标
		result.append(map_to_world(cell) + cell_size / 2)
	# result: 终点与起点间的所有点
	return result

# ========= 存图块索引数组 ==========
func 存图块索引():
	for i in get_child_count():
		图块索引字典[str(world_to_map(get_child(i).position))] = i

# ========= 设置图块索引（权重） ==========
func set_tile() -> void:
	cells["BOSS"] = []
	cells["丘陵"] = []
	cells["乐手"] = []
	for x in 长:
		for y in 宽:
			var pos: Vector2 = Vector2(x, y)
			var alt: float = altitude.get(pos, Vector2.ZERO)
			if alt < 0.2:
				# 为图块设置索引
				set_cellv(pos, 0)
				cells["BOSS"].append(pos)
			elif alt >= 0.2 and alt < 0.4:
				set_cellv(pos, 1)
				cells["丘陵"].append(pos)
			else:
				set_cellv(pos, 2)
				cells["乐手"].append(pos)


# ========= 连接路径点 ==========
func connect_astar() -> void:
	# used_cells 是 图块集中所有单元格的位置
	var used_cells: Array = get_used_cells()
	# 有多少个图块就循环多少次
	for i in used_cells.size():
		var weight_scale: float = 10.0
		var cell: Vector2 = used_cells[i]
		# 设置权重
		match get_cellv(cell):
			0:
				weight_scale = 3.0
			1:
				weight_scale = 2.0
			2:
				weight_scale = 1.0
		astar.add_point(i, cell, weight_scale)
		cell_map[cell] = i
	var points: Array = astar.get_points()
	var point_count: int = astar.get_point_count()
	for i in point_count:
		for j in range(i + 1, point_count):
			if is_equal_approx(astar.get_point_position(i).distance_to(astar.get_point_position(j)), 1.0):
				astar.connect_points(i, j)

# ========= Input函数 ==========
func _input(event: InputEvent) -> void:
	if get_used_rect().has_point(get_global_mouse_position()):
		if event is InputEventMouseButton:
			# 按左键就画线
			if event.button_index == BUTTON_LEFT and event.is_pressed():
				var path = 得到路径点(get_node("../Player").position, get_global_mouse_position())
				# path : Array
				draw_path(path)
				get_node("..").寻路(path)
			# 右键清除线
			elif event.button_index == BUTTON_RIGHT and event.is_pressed():
				draw_path([])

# ========= 设置画线 ==========
func set_to_position(pos: Vector2) -> void:
	var path = 得到路径点(get_node("../Player").position, get_global_mouse_position())
	draw_path(path)

# ========= 画线函数 ==========
func draw_path(path: Array) -> void:
	line.points = path

# ========= 生成地图 ==========
func born_map():
	# 生成地图
	var random = RandomNumberGenerator.new()
	for x in 宽:
		# 一维数组
		var od_arr = []
		for y in 长:
			random.randomize()
			# 实例化新图块
			var single_block = 数据.map_block.new()
			# 添加图块进数组
			od_arr.append(single_block)
		# 把一维数组放到map_data
		map_data.append(od_arr)
	# 将map_data转换成tilemap
	for x in map_data.size():
		for y in map_data[x].size():
			self.set_cell(x,y,map_data[x][y].type)

# ========= 替换场景函数 ==========
func instance_tiles(tile_name, scene):
	var id = self.tile_set.find_tile_by_name(tile_name)
	assert(id != -1)
	for pos in self.get_used_cells_by_id(id):
		var node = scene.instance()
		self.add_child(node)
		node.position = self.map_to_world(pos) + self.cell_size / 2
		self.set_cellv(pos, -1)

func 场景替换图块():
	instance_tiles("奇遇", preload("res://资源/场景/图块/奇遇.tscn"))
	instance_tiles("BOSS", preload("res://资源/场景/图块/BOSS.tscn"))
	instance_tiles("劫匪", preload("res://资源/场景/图块/劫匪.tscn"))
	instance_tiles("商店", preload("res://资源/场景/图块/商店.tscn"))
	instance_tiles("小镇", preload("res://资源/场景/图块/小镇.tscn"))
	instance_tiles("酒馆", preload("res://资源/场景/图块/酒馆.tscn"))
	instance_tiles("驿站", preload("res://资源/场景/图块/驿站.tscn"))
	instance_tiles("丘陵", preload("res://资源/场景/图块/丘陵.tscn"))
	instance_tiles("乐手", preload("res://资源/场景/图块/乐手.tscn"))
	instance_tiles("乞丐", preload("res://资源/场景/图块/乞丐.tscn"))
	instance_tiles("冰川", preload("res://资源/场景/图块/冰川.tscn"))
	instance_tiles("森林", preload("res://资源/场景/图块/森林.tscn"))
	instance_tiles("商人", preload("res://资源/场景/图块/商人.tscn"))
	instance_tiles("商店", preload("res://资源/场景/图块/商店.tscn"))
	instance_tiles("城堡", preload("res://资源/场景/图块/城堡.tscn"))
	instance_tiles("城市", preload("res://资源/场景/图块/城市.tscn"))
	instance_tiles("大山", preload("res://资源/场景/图块/大山.tscn"))
	instance_tiles("大海", preload("res://资源/场景/图块/大海.tscn"))
	instance_tiles("学者", preload("res://资源/场景/图块/学者.tscn"))
	instance_tiles("小溪", preload("res://资源/场景/图块/小溪.tscn"))
	instance_tiles("平原", preload("res://资源/场景/图块/平原.tscn"))
	instance_tiles("怪物", preload("res://资源/场景/图块/怪物.tscn"))
	instance_tiles("沼泽", preload("res://资源/场景/图块/沼泽.tscn"))
	instance_tiles("瀑布", preload("res://资源/场景/图块/瀑布.tscn"))
	instance_tiles("火山", preload("res://资源/场景/图块/火山.tscn"))
	instance_tiles("盆地", preload("res://资源/场景/图块/盆地.tscn"))
	instance_tiles("精英", preload("res://资源/场景/图块/精英.tscn"))
	instance_tiles("荒地", preload("res://资源/场景/图块/荒地.tscn"))
	instance_tiles("诗人", preload("res://资源/场景/图块/诗人.tscn"))
	instance_tiles("陷阱", preload("res://资源/场景/图块/陷阱.tscn"))
	instance_tiles("高原", preload("res://资源/场景/图块/高原.tscn"))
	instance_tiles("人类", preload("res://资源/场景/图块/人类.tscn"))
