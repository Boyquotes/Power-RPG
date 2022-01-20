extends "res://脚本/UI/战斗行动条.gd"

onready var 敌人名 = $"Panel/玩家名"

func _ready():
	敌人名.text = 数据.这次战斗敌人名
