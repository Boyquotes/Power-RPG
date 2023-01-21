extends Node2D

onready var tilemap = $Tilemap

var player = preload("res://资源/场景/实体/Player.tscn")
var random = RandomNumberGenerator.new()

func _ready():
	Uhd.get_node("UHD顶栏").hide()
	初始化单位位置()

func 初始化单位位置():
	pass
	# 初始化敌人位置

