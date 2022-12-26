extends KinematicBody2D

onready var player = $Sprite

func Move(pos):
	print("Move")
	self.position = pos
