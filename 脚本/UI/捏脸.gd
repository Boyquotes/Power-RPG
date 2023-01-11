extends Node2D

var 脸型的值
var 眉毛的值
var 嘴巴的值
var 眼睛的值
var 鼻子的值
var 头发的值
var 衣服的值
var 玩家立绘

var 脸型总值 = 7
var 头发总值 = 5
var 眼睛总值 = 4
var 眉毛总值 = 5
var 嘴巴总值 = 5
var 鼻子总值 = 5
var 衣服总值 = 4

onready var 玩家脸型 = $立绘/头/脸型
onready var 玩家眉毛 = $立绘/头/左眉毛
onready var 玩家眼睛 = $立绘/头/左眼睛
onready var 玩家嘴巴 = $立绘/头/嘴巴
onready var 玩家鼻子 = $立绘/头/鼻子
onready var 玩家头发 = $立绘/头/头发
onready var 玩家衣服 = $立绘/衣服
onready var 玩家名 = $Control/Vbox/Hbox/Panel/Vbox2/Marigin/Vbox/名字/Vbox/MarginContainer/LineEdit
# 性别是个Group
onready var 玩家性别 = $Control/Vbox/Hbox/Panel/Vbox2/Marigin/Vbox/性别/Vbox/MarginContainer/HBoxContainer/男

func _ready():
	初始化捏脸值()
	

func 初始化捏脸值():
	脸型的值 = 1
	眉毛的值 = 1
	鼻子的值 = 1
	嘴巴的值 = 1
	衣服的值 = 1
	眼睛的值 = 1
	头发的值 = 1
	

func 捏脸改变(当前值, 总值, 顺序, 路径, 类型):
	if 顺序 == "下一个":
		if 当前值 >= 总值:
			if 类型 == 玩家脸型:
				脸型的值 = 1
			elif 类型 == 玩家眉毛:
				眉毛的值 = 1
			elif 类型 == 玩家眼睛:
				眼睛的值 = 1
			elif 类型 == 玩家嘴巴:
				嘴巴的值 = 1
			elif 类型 == 玩家鼻子:
				鼻子的值 = 1
			elif 类型 == 玩家头发:
				头发的值 = 1
			elif 类型 == 玩家衣服:
				衣服的值 = 1
			当前值 = 1
		else:
			if 类型 == 玩家脸型:
				脸型的值 += 1
			elif 类型 == 玩家眉毛:
				眉毛的值 += 1
			elif 类型 == 玩家眼睛:
				眼睛的值 += 1
			elif 类型 == 玩家嘴巴:
				嘴巴的值 += 1
			elif 类型 == 玩家鼻子:
				鼻子的值 += 1
			elif 类型 == 玩家头发:
				头发的值 += 1
			elif 类型 == 玩家衣服:
				衣服的值 += 1
		类型.texture = load(路径 + str(当前值) + ".png")
	else:
		if 当前值 == 1:
			# 每次当前值都是重新传过来的
			if 类型 == 玩家脸型:
				脸型的值 = 总值
			elif 类型 == 玩家眉毛:
				眉毛的值 = 总值
			elif 类型 == 玩家眼睛:
				眼睛的值 = 总值
			elif 类型 == 玩家嘴巴:
				嘴巴的值 = 总值
			elif 类型 == 玩家鼻子:
				鼻子的值 = 总值
			elif 类型 == 玩家头发:
				头发的值 = 总值
			elif 类型 == 玩家衣服:
				衣服的值 = 总值
			当前值 = 总值
		else:
			# 当前值不是传进来的变量，而是int
			if 类型 == 玩家脸型:
				脸型的值 -= 1
			elif 类型 == 玩家眉毛:
				眉毛的值 -= 1
			elif 类型 == 玩家眼睛:
				眼睛的值 -= 1
			elif 类型 == 玩家嘴巴:
				嘴巴的值 -= 1
			elif 类型 == 玩家鼻子:
				鼻子的值 -= 1
			elif 类型 == 玩家头发:
				头发的值 -= 1
			elif 类型 == 玩家衣服:
				衣服的值 -= 1
		类型.texture = load(路径 + str(当前值) + ".png")

func _on_上一个脸_pressed():
	print(脸型的值)
	捏脸改变(脸型的值, 脸型总值, "上一个", "res://资源/图片/捏脸/脸型/脸型", 玩家脸型)

func _on_下一个脸_pressed():
	捏脸改变(脸型的值, 脸型总值, "下一个", "res://资源/图片/捏脸/脸型/脸型", 玩家脸型)

func _on_上一个头发_pressed():
	捏脸改变(头发的值, 头发总值, "上一个", "res://资源/图片/捏脸/头发/头发", 玩家头发)

func _on_下一个头发_pressed():
	捏脸改变(头发的值, 头发总值, "下一个", "res://资源/图片/捏脸/头发/头发", 玩家头发)

func _on_上一个眼睛_pressed():
	捏脸改变(眼睛的值, 眼睛总值, "上一个", "res://资源/图片/捏脸/眼睛/眼睛", 玩家眼睛)

func _on_下一个眼睛_pressed():
	捏脸改变(眼睛的值, 眼睛总值, "下一个", "res://资源/图片/捏脸/眼睛/眼睛", 玩家眼睛)

func _on_上一个眉毛_pressed():
	捏脸改变(眉毛的值, 眉毛总值, "上一个", "res://资源/图片/捏脸/眉毛/眉毛", 玩家眉毛)

func _on_下一个眉毛_pressed():
	捏脸改变(眉毛的值, 眉毛总值, "下一个", "res://资源/图片/捏脸/眉毛/眉毛", 玩家眉毛)

func _on_上一个嘴巴_pressed():
	捏脸改变(嘴巴的值, 嘴巴总值, "上一个", "res://资源/图片/捏脸/嘴巴/嘴巴", 玩家嘴巴)

func _on_下一个嘴巴_pressed():
	捏脸改变(嘴巴的值, 嘴巴总值, "下一个", "res://资源/图片/捏脸/嘴巴/嘴巴", 玩家嘴巴)

func _on_上一个衣服_pressed():
	捏脸改变(衣服的值, 衣服总值, "上一个", "res://资源/图片/捏脸/衣服/衣服", 玩家衣服)

func _on_下一个衣服_pressed():
	捏脸改变(衣服的值, 衣服总值, "下一个", "res://资源/图片/捏脸/衣服/衣服", 玩家衣服)


func _on_左眉毛_texture_changed():
	$立绘/头/右眉毛.texture = $立绘/头/左眉毛.texture

func _on_左眼睛_texture_changed():
	$立绘/头/右眼睛.texture = $立绘/头/左眼睛.texture


func _on_完成_pressed():
	print("玩家名：" + 玩家名.text)
	print("玩家性别：" + 玩家性别.group.get_pressed_button().name)
	
