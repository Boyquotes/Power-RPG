extends Control

onready var skills = $技能

func _ready():
#	skills.hide()
	pass

func _on_攻击_pressed():
	get_tree().call_group("战斗系统", "攻击")
	

func _on_技能_pressed():
	get_tree().call_group("战斗系统", "技能")
	

func _on_道具_pressed():
	get_tree().call_group("战斗系统", "道具")
	

func _on_逃跑_pressed():
	get_tree().call_group("战斗系统", "逃跑")
	

func _on_技能_mouse_entered():
	skills.show()
	pass


func _on_技能_mouse_exited():
	skills.hide()
	pass


func _on_技能表_mouse_entered():
	skills.show()
	pass


func _on_技能表_mouse_exited():
	skills.hide()
	pass
