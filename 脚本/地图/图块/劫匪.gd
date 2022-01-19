extends "res://脚本/地图/格子模板.gd"

func _ready():
	print("劫匪准备好了")
	
func _on_劫匪_body_entered(body):
	print("劫匪撞上了")
	get_tree().call_group("地图", "dialog")
	
