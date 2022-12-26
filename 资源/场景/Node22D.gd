extends Node2D

var resource = preload("res://资源/对话/测试对话.tres")

func _ready():
	Uhd.dialog_normal("Test", resource)
