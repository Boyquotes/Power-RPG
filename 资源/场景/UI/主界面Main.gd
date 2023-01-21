extends Control

func _ready():
	Uhd.get_node("UI").hide()

func _on_新游戏_pressed():
	mmkv.initMMKV("厉害RPG", "save.default")
	changer_scence.changer("res://资源/场景/UI/创建角色.tscn")

func _on_退出_pressed():
	get_tree().quit()
