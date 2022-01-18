extends CanvasLayer

onready var map_name = $Panel/一号
onready var map_name_en = $Panel/二号
onready var map_name_b = 数据.Map_name_data[500001]
onready var map_name_en_b = 数据.Map_name_data[500001]

func _ready():
	
	map_name.text = map_name_b.前缀
	
	
