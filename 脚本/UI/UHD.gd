extends CanvasLayer

var 打开UHD

func _physics_process(delta):
	get_input()

func get_input():
	if Input.is_action_just_pressed("esc"):
		if 数据.在大地图 == true:
			if 打开UHD == false:
				Uhd.layer = 1
				打开UHD = true
			else:
				Uhd.layer = -128
				打开UHD = false

