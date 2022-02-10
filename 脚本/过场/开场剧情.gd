extends Control

onready var animal = $AnimationPlayer

func _ready():
	yield(get_tree().create_timer(1.0), "timeout")
	animal.play("开始")
	yield(animal, "animation_finished")
	yield(get_tree().create_timer(2.0), "timeout")
	changer_scence.changer("res://资源/场景/Test2.tscn")
