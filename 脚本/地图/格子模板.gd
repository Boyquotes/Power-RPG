extends Node2D

var block
var map_name_text
var event_id
var npcs_id
var 信息数组 = []
var 事件数组 = []
var NPC数组 = []
# 存档
#var mmkv = _mmkv.new()

onready var map_name_list = 数据.Map_name_data[500001]

var random = RandomNumberGenerator.new()

func _init():
	mmkv.initMMKV("厉害RPG", "save.default") 

func save():
	print("HHHHHHHHHHH")
	var block_dic = {
		"npcs": NPC数组,
		"event": 事件数组,
		"info": 信息数组,
	}
	
	mmkv.setDict("npcs", NPC数组)
	mmkv.setDict("event", 事件数组)
	mmkv.setDict("info", 信息数组)
	
	print("ZZZZZZZZZZZ")

# 读取存档
func load_save():
	# 清除数组
	信息数组.clear()
	NPC数组.clear()
	事件数组.clear()
	# 重新给数组赋值
	事件数组 = mmkv.getDict("event")
	NPC数组 = mmkv.getDict("npcs")
	信息数组 = mmkv.getDict("info")

func _ready():
	# 随机数
	random.randomize()
	
	# 实例化新图块
	block = 数据.map_block.new()
	
	# 添加地名
	var number = random.randi_range(500001, 500864)
	map_name_text = 数据.Map_name_data[number].地名
	var number2 = random.randi_range(900001, 900184)
	block.name = map_name_text
	
	# 添加事件
	add_event()
	# 添加NPC
	add_npc()
	
	# 设定block（Class）值
	block.npcs = NPC数组
	block.event = 事件数组
	
	block.type = random.randi_range(0, 15)
	block.wood = random.randi_range(0, 1000)
	block.food = random.randi_range(0, 1000)
	block.metals = random.randi_range(0, 1000)
	block.medicinal = random.randi_range(0, 1000)
	block.fabric = random.randi_range(0, 1000)
	block.coin = random.randi_range(0, 1000)
	block.time = random.randi_range(1, 5)
	
	
	#顺序：名称 木材 食物 药材 金石 织物 金币 时间 类型
	信息数组.append(block.name)
	信息数组.append(block.wood)
	信息数组.append(block.food)
	信息数组.append(block.medicinal)
	信息数组.append(block.metals)
	信息数组.append(block.fabric)
	信息数组.append(block.coin)
	信息数组.append(block.time)
	
	信息数组.append(block.type)
	
	# 以类型设置图块
	$Sprite.frame = block.type

func add_npc():
	NPC数组.clear()
	var temp_num = random.randi_range(0, 1)
	# 决定有没有NPC
	if temp_num == 0: # 没有NPC
		print("没有NPC")
		NPC数组.append("没有NPC")
		print(NPC数组)
	else: # 有NPC
		print("有NPC")
		# 决定有多少NPC
		temp_num = random.randi_range(1, 4)
		# 循环添加NPC
		for i in temp_num:
			# 取NPC的ID
			var number3 = random.randi_range(600001, 601123)
			npcs_id = 数据.Npc_name_data[number3].id
			NPC数组.append(npcs_id)

func add_event():
	事件数组.clear()
	var temp_num = random.randi_range(0, 1)
	# 决定有没有事件
	if temp_num == 0: # 没有事件
		print("没有事件")
		事件数组.append("没有NPC")
		print(事件数组)
	else: # 有事件
		print("有NPC")
		# 决定有多少事件
		temp_num = random.randi_range(1, 4)
		# 循环添加事件
		for i in temp_num:
			# 取事件的ID
			var number3 = random.randi_range(900001, 900184)
			event_id = 数据.Event_data[number3].id
			事件数组.append(event_id)

# 当悬浮，更新信息
func _on_格子模板_mouse_entered():
	var name = self.name
	print("悬浮了" + name)
	get_tree().call_group("信息框", "更新", 信息数组, 事件数组, NPC数组)
	
	# 获取鼠标坐标
	var mouse_pos = get_viewport().get_mouse_position()
	# 设置信息框
	get_tree().call_group("地图", "信息框", mouse_pos)
	print(mouse_pos)

func _on_格子模板_mouse_exited():
	# 设置信息框
	get_tree().call_group("地图", "关闭信息框")
	pass

func _on_格子模板_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		match event.button_index:
			BUTTON_LEFT:
				if event.is_pressed():
					get_tree().call_group("Player", "Move", get_viewport().get_mouse_position())
					print("点击左键")
