extends Node

export(String) var data
export(Resource) var item_data
export(NodePath) var inventory_base_path
export(PackedScene) var item_template
export(String) var item_name
export(String) var item_num
export(String) var item_icon

var _data
var inventory_base
var del_array:Array = []

func _ready():
	_data = load(data).new()
	inventory_base = get_node(inventory_base_path)

func add_item(id:int, num:int, type:String) -> void:
	if inventory_base.get_child_count() != 0:
		for i in inventory_base.get_child_count():
			if inventory_base.get_child(i).item_id == id:
				# 存在物品
				inventory_base.get_child(i).get_node(item_num).text =\
				str(int(inventory_base.get_child(i).get_node(item_num).text) + num)
			else:
				# 不存在物品
				var _add_node = item_template.instance()
				inventory_base.add_child(_add_node)
				# 设置物品属性
				_add_node.get_node(item_name).text = _data[type].data()[id].name
				_add_node.get_node(item_num).text = str(num)
				_add_node.get_node(item_icon).texture = load(_data[type].data()[id].icon)
				_add_node.item_id = id
	else:
		print_debug("不存在物品")
		var _add_node = item_template.instance()
		inventory_base.add_child(_add_node)
		_add_node.get_node(item_name).text = _data[type].data()[id].name
		_add_node.get_node(item_num).text = str(num)
		print("aaaa" + _data[type].data()[id].icon)
		_add_node.get_node(item_icon).texture = load(_data[type].data()[id].icon)
		_add_node.item_id = id

func del_item(id:int, num:int, type:String) -> void:
	var now_item_num:int = 0
	for i in inventory_base.get_child_count(): # -> int
		if inventory_base.get_child(i).item_id == id:
			print_debug("找到ID，添加进删除列表")
			# 先比较删除数量大小
			now_item_num = int(inventory_base.get_child(i).get_node(item_num).text)
			# 如果当前量小于要删除的量
			if now_item_num <= num:
				now_item_num = 0
				del_array.append(inventory_base.get_child(i).get_index())
			else:
				now_item_num = now_item_num - num
				del_array.append(inventory_base.get_child(i).get_index())
		else:
			print_debug("没找到ID")
	for i in del_array:
		if now_item_num == 0:
			inventory_base.remove_child(inventory_base.get_child(del_array[i]))
		else:
			inventory_base.get_child(i).get_node(item_num).text = str(now_item_num)

func catego_item(category:String) -> void:
	pass

func sort_item() -> void:
	pass
