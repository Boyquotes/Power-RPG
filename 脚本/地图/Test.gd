extends Node2D

onready var tilemap = $TileMap
onready var player = $Player
onready var tween = $Tween
onready var line = $Line
onready var camera = $Camera2D

var 图块字典 = {}
var astar = AStar2D.new()
var pos
# 缩放倍数
var zoom_num = 1
# 鼠标是否点击中键
var is_mouse_mid_click:bool
# 鼠标点击中键具体位置
var mouse_click_pos:Vector2
# 相机当前位置
var camera_now_pos:Vector2

func _init():
	mmkv.initMMKV("厉害RPG", "save.default") 

func _ready():
	Uhd.get_node("UHD顶栏").show()
	Console.add_command('print', self, 'P_print')\
		.set_description('Prints anything')\
		.add_argument('text', TYPE_STRING)\
		.register()

# ============ 寻路 ============
func 寻路(路径点):
	for i in 路径点.size() - 1:
		tween.interpolate_property(player, "global_position",
			player.global_position, 路径点[i], 0.2,
			Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		tween.start()
		yield(tween, "tween_completed")
		
	# 需要拿到player站着的图块索引
	# from是图块索引
	var from = str(tilemap.world_to_map(player.position))
	from = tilemap.图块索引字典[from]
	var block = tilemap.get_child(from).block
	Uhd.UHD顶栏更新(block)

func _process(delta):
	#添加一个镜头缩放缓动效果
	camera.zoom = lerp(camera.zoom,Vector2(zoom_num,zoom_num),8*delta)

func P_print(text):
	print(text)

# ============ 监听鼠标操作 ============
func _input(event):
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
	# 这个放外边是为了点击中键的时候及时刷新相机位置
	if is_mouse_mid_click:
		var offset = mouse_click_pos - event.position
		camera.position = camera_now_pos + offset

# ============ 三个按钮 ============
func _on_load_pressed():
	get_tree().call_group("图块", "load_save")

func _on_save_pressed():
	get_tree().call_group("图块", "save")

func _on_build_pressed():
#	born_map()
	pass
