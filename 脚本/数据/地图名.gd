extends CanvasLayer

onready var map_name = $Panel/一号
onready var map_name_en = $Panel/二号
onready var map_name_b = 数据.Map_name_data[500001]
onready var map_name_en_b = 数据.Map_name_data[500001]

func _ready():
	randomize()
	var number = randi()%8+500001
	map_name_b = 数据.Map_name_data[number]
	var map_name_back = map_name_b.前缀
	var map_name_en_back = map_name_b.前缀英文
	number = randi()%8+500001
	map_name_b = 数据.Map_name_data[number]
	map_name.text = map_name_back + map_name_b.后缀
	map_name_en.text = map_name_en_back + map_name_b.后缀英文
	
	
