extends "res://脚本/地图/格子模板.gd"

func _ready():
	print("大海准备好了")


func _on_大海_body_entered(body):
	changer_scence.changer("res://资源/场景/Test5.tscn", "nothing")
