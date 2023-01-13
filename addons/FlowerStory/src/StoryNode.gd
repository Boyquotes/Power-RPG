extends Node

export(NodePath) var story_board
export(PackedScene) var story_line
export(String) var data
export(String) var type
export(String) var map_name_key
export(Array) var map_num

var rng = RandomNumberGenerator.new()
var time
var _data
var text:String
var number
var action_type:Dictionary = 数据.互动类型
var text_tem:String
#	 0     1      2       3      4       5          6
# [小王, 小李，十月四日，北京，指导，界青十四剑，指导武功]

func _ready():
	_data = load(data).new()

func Generate_story(content:Array):
	# [十一月二十一日]，小王在[北京][指导]小李[界青十四剑]
	if content[3] == null:
		rng.randomize()
		number = rng.randi_range(map_num[0], map_num[1])
		content[3] = _data[type].data()[number][map_name_key]
		
	if content[4] == null:
		var temp_num = rng.randi_range(0, action_type.values().size())
		print(temp_num)
		content[4] = action_type.values()[temp_num]
		
	if content[5] == null:
		pass
		
	if content[6] == null:
		# 返回键值列表的大小
		var temp_num = rng.randi_range(0, action_type.values().size())
		print(temp_num)
		content[6] = action_type.values()[temp_num]
		# todo
		# 替换content[6]的角色A角色B
		
	text = str(content[2]) + str(content[0]) + "在" + content[3] + content[4] + str(content[1]) + content[5] + content[6]
#	text = text_tem
	add_line()
	

func add_line():
	var line_node = story_line.instance()
	line_node.text = text
	get_node(story_board).add_child(line_node)
