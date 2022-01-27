extends Control

var now_load
var item_loder

func _ready():
	set_process(false)
	loading()

func _process(delta):
	now_load = 数据.loader.get_stage()
	数据.loader.poll()
	$ProgressBar.value = now_load % item_loder
	if 数据.loader.get_resource():
		get_tree().change_scene_to(数据.loader.get_resource())


func loading():
	数据.loader = ResourceLoader.load_interactive(数据.load_path)
	item_loder = 数据.loader.get_stage_count()
	$ProgressBar.max_value = item_loder - 1
	set_process(true)
