extends "res://脚本/地图/格子模板.gd"

var dialog = Dialogic.start("test")

func _ready():
	print("劫匪准备好了")
	
func _on_劫匪_body_entered(body):
	print("劫匪撞上了")
#	add_child(dialog)
#	数据.这次战斗敌人名 = 数据.Enemy_data[400001].name
#	数据.敌人立绘 = "res://资源/图片/立绘/主角小.png"
	数据.这次战斗敌人 = 400001
	changer_scence.changer("res://资源/场景/战斗系统.tscn", "nothing")
