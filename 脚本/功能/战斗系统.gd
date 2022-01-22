extends Node2D

var player_time = 0
var enemy_time = 0

onready var 玩家立绘 = $玩家
onready var 敌人立绘 = $敌人
#onready var 玩家立绘P = 数据.player["Img"]
onready var time = $玩家回合
onready var e_time = $敌人回合
onready var animal = $AnimationPlayer

var 行动点 = 数据.行动点
var speed = 数据.player["Speed"]

func _ready():
	初始化()
	

func 初始化():
	行动点 = 0
	time.wait_time = speed
	time.start()
	玩家立绘.texture = load("res://资源/图片/立绘/主角小.png")
	敌人立绘.texture = load("res://资源/图片/立绘/主角小.png")
	

func _on_玩家_timeout():
	print("玩家过了一回合")
	行动点 += 1
	print("当前行动点：" + str(行动点))
	get_tree().call_group("玩家行动点容器", "玩家添加行动点")
	

func 攻击():
	print("按下了攻击")
	if 行动点 > 0:
		数据.行动点 -= 1
		get_tree().call_group("玩家行动点容器", "玩家消耗行动点")
		print("消耗了一个行动点")
		animal.play("玩家攻击")
		yield(animal, "animation_finished")
		animal.play_backwards("玩家攻击")
		yield(animal, "animation_finished")
	else:
		print(行动点)
		print("行动点不足")
	

func 技能():
	print("按下了技能")
	

func 道具():
	print("按下了道具")
	

func 逃跑():
	print("按下了逃跑")
	
