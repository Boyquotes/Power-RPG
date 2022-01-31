extends CanvasLayer

var 打开UHD

func _ready():
	Uhd.layer = -128

func _input(event):
	if Input.is_action_just_pressed("esc"):
		if 数据.在大地图 == true:
			if 打开UHD == false:
				get_tree().call_group("背包", "初始化")
				Uhd.layer = 1
				打开UHD = true
			else:
				Uhd.layer = -128
				打开UHD = false

