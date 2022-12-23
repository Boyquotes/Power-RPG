extends Control

onready var room_sence = preload("res://资源/场景/UI/房间.tscn")
onready var room = room_sence.instance()

func _ready():
	self.add_child(room)
