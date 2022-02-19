extends Node2D

onready var player_node = $主角
onready var enemy_node  = $敌人

var player
var enemy

func _ready():
	初始化()
	战斗开始()
	战斗中()
	战斗结束()

func 初始化():
	print("开始初始化")

func 战斗开始():
	print("战斗开始")

func 战斗中():
	print("战斗中")

func 战斗结束():
	print("战斗结束")
