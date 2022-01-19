extends CanvasLayer

onready var map_name = $Panel/一号
onready var map_name_en = $Panel/二号

onready var map_name_b = 数据.Map_name_data[500001]

onready var animal = $AnimationPlayer

func _ready():
	animal.play("RESET")
	randomize()
	var number = randi()%864+500001
	map_name_b = 数据.Map_name_data[number]
	map_name.text = map_name_b.地名
	map_name_en.text = map_name_b.地名英文
	animal.play("地图名")
	yield(animal, "animation_finished")
	$Panel.hide()
	
