extends Control

onready var skills = $技能框框/技能表
onready var 技能1 = $技能框框/技能表/技能1
onready var 技能2 = $技能框框/技能表/技能2
onready var 技能3 = $技能框框/技能表/技能3
onready var 技能名 = $技能框框/技能名
onready var 玩家技能1 = 数据.player_skills[0]
onready var 技能1图标 = load(数据.Skills_data[玩家技能1].img)

func _ready():
	skills.hide()
	技能名.hide()
	print(数据.Skills_data[玩家技能1].img)
	print(技能1.texture_normal.resource_path)
	技能1.texture_normal = 技能1图标
	

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
	技能名.show()
	

func _on_技能框框_mouse_entered():
	skills.show()
	技能名.show()
	

func _on_技能框框_mouse_exited():
	skills.hide()
	技能名.hide()


func _on_技能_mouse_exited():
	skills.hide()
	技能名.hide()
	


	

