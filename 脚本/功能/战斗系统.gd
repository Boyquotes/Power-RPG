extends Node2D

var player_time = 0
var enemy_time = 0

onready var 玩家立绘 = $玩家
onready var 敌人立绘 = $敌人

onready var speed = 数据.player["Speed"]
onready var 玩家立绘P = 数据.player["Img"]
onready var time = $玩家回合

onready var e_time = $敌人回合

func _ready():
	print(speed)
	time.wait_time = speed / 10
	print(time.wait_time)
	time.start()

func 初始化():
	
	玩家立绘.texture = "res://资源/图片/立绘/主角小.png"
	敌人立绘.texture = "res://资源/图片/立绘/主角小.png"
	

func _on_玩家_timeout():
	print("玩家过了一回合")
	player_time += 1
	print(player_time)
	get_tree().call_group("战斗行动条", "增加行动点")
	

func 攻击():
	print("按下了攻击")
	

func 技能():
	print("按下了技能")
	

func 道具():
	print("按下了道具")
	

func 逃跑():
	print("按下了逃跑")
	
