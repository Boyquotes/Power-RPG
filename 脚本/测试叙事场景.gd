extends Control

func _ready():
	数据.dialog_res = preload("res://资源/对话/测试对话.tres")
	Uhd.dialog_normal("Tese2", 数据.dialog_res)
