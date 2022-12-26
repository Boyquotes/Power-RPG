extends Node2D

export(int, 0,800) var 生成图块数 = 100
export var 长 = 10
export var 宽 = 10

onready var tilemap = $TileMap
onready var map_data = []
onready var camera = $Camera2D


var new_dialog = Dialogic.start('Test')

var pos
# 缩放倍数
var zoom_num = 1
# 鼠标是否点击中键
var is_mouse_mid_click:bool
# 鼠标点击中键具体位置
var mouse_click_pos:Vector2
# 相机当前位置
var camera_now_pos:Vector2

var file = File.new()
var resource = preload("res://资源/对话/测试对话.tres")


func _ready():
	# 设置摄像机视野缩放比例 此比例会用在获取tilemap坐标中
	camera.zoom = Vector2(zoom_num,zoom_num)
	var random = RandomNumberGenerator.new()
	for x in 宽:
		# 一维数组
		var od_arr = []
		for y in 长:
			random.randomize()
			# 实例化新图块
			var single_block = 数据.map_block.new()
			# 为图块赋值
			single_block.type = random.randi_range(0, 9)
			single_block.wood = random.randi_range(0, 1000)
			single_block.food = random.randi_range(0, 1000)
			# 添加图块进数组
			od_arr.append(single_block)
			
		# 把一维数组放到map_data
		map_data.append(od_arr)
		print("打印:" + str(od_arr))
		
	# 将map_data转换成tilemap
	for x in map_data.size():
		for y in map_data[x].size():
			tilemap.set_cell(x,y,map_data[x][y].type)
			print(x,y,map_data[x][y].type)
	# 场景替换图块
	场景替换图块()
	add_child(new_dialog)
	var file = File.new()
	if file.file_exists("C://Users/Administrator/AppData/Roaming/Godot/厉害RPG/save.default"):
		print("存档文件存在，开始读档")
		get_tree().call_group("图块", "load_save")
	else:
		print("存档文件不存在，创建新存档")
		get_tree().call_group("图块", "save")
	

func 信息框(鼠标坐标):
	Uhd.悬浮信息框.rect_position = 鼠标坐标
	Uhd.悬浮信息框.popup()

func 关闭信息框():
	Uhd.悬浮信息框.hide()
	pass

# 监听鼠标操作
func _input(event):
	if Input.is_action_just_pressed("tab"):
		Uhd.tab()
	if event is InputEventMouseButton:
		match event.button_index:
			
			# 鼠标滚轮向上
			BUTTON_WHEEL_UP:
				if zoom_num < 0.5:
					return
				zoom_num -= 0.1
			# 鼠标滚轮向下
			BUTTON_WHEEL_DOWN:
				if zoom_num > 3.1:
					return
				zoom_num += 0.1
			# 鼠标中键 按住拖动地图
			BUTTON_MIDDLE:
				# 中键按下记录起始点
				if event.is_pressed():
					is_mouse_mid_click = true
					mouse_click_pos = event.position
					camera_now_pos = camera.position
				# 中键取消 计算偏移量
				else:
					is_mouse_mid_click = false
					mouse_click_pos = Vector2.ZERO
			# 鼠标左键 展示地块信息
			BUTTON_LEFT:
				if event.is_pressed():
					pos = event.position
					# pos需要计算摄影机的缩放补偿与拖拽偏移量 才能正确的获得tilemap坐标
					pos = pos*zoom_num+camera.position
					var map_position = tilemap.world_to_map(pos)
					if tilemap.get_cellv(map_position) == -1:
						return
					get_block_info(map_position)
	# 这个放外边是为了点击中键的时候及时刷新相机位置
	if is_mouse_mid_click:
		var offset = mouse_click_pos - event.position
		camera.position = camera_now_pos + offset

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

func get_block_info(vec:Vector2):
	map_data[vec.x][vec.y].sout()

func instance_tiles(tile_name, scene):
	var id = tilemap.tile_set.find_tile_by_name(tile_name)
	assert(id != -1)
	for pos in tilemap.get_used_cells_by_id(id):
		var node = scene.instance()
		tilemap.add_child(node)
		node.position = tilemap.map_to_world(pos) + tilemap.cell_size / 2
		tilemap.set_cellv(pos, -1)
		

func _process(delta):
	#添加一个镜头缩放缓动效果
	camera.zoom = lerp(camera.zoom,Vector2(zoom_num,zoom_num),8*delta)



	
	
#	数据.dialog_res = preload("res://资源/对话/测试对话.tres")
#	DialogueManager.show_example_dialogue_balloon(
#		"Test",
#		数据.dialog_res
#	)
#	地图生成初始化()

