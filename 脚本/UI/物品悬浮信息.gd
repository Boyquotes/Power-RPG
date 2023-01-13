extends Panel


onready var 名称 = $Panel/Vbox/VVbox/MarginContainer/武器名
#onready var 描述
onready var 攻击 = $Panel/Vbox/Mar/Vbox/Vbox/Hbox/Vbox/Hbox/Label2
onready var 防御 = $Panel/Vbox/Mar/Vbox/Vbox/Hbox/Vbox/Hbox2/Label2
onready var 速度 = $Panel/Vbox/Mar/Vbox/Vbox/Hbox/Vbox2/Hbox/Label2
onready var 重量 = $Panel/Vbox/Mar/Vbox/Vbox/Hbox/Vbox2/Hbox3/Label2
onready var 幸运 = $Panel/Vbox/Mar/Vbox/Vbox/Hbox/Vbox/Hbox3/Label2
onready var 价值 = $Panel/Vbox/Mar/Vbox/Vbox/Hbox/Vbox2/Hbox2/Label2

func update_info(item_info:Array):
	# 0:name 1:desc 2:attack 3:defence 4:speed 5:value 6:weight 7:lucky
	名称.text = item_info[0]
	攻击.text = str(item_info[2])
	防御.text = str(item_info[3])
	速度.text = str(item_info[4])
	价值.text = str(item_info[5])
	重量.text = str(item_info[6])
	幸运.text = str(item_info[7])
	
