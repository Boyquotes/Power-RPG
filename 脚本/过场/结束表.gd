extends Control

onready var label = $CenterContainer/VBoxContainer/Label
onready var animal = $AnimationPlayer

func _ready():
	animal.play("RESET")
	yield(get_tree().create_timer(1.0), "timeout")
	animal.play("开始")
	yield(animal, "animation_finished")
	yield(get_tree().create_timer(1.0), "timeout")
	animal.play_backwards("开始")
	yield(animal, "animation_finished")
	label.text = "独立游戏 / 厉害RPG"
	yield(get_tree().create_timer(1.0), "timeout")
	animal.play("开始")
	yield(animal, "animation_finished")
	yield(get_tree().create_timer(1.0), "timeout")
	animal.play_backwards("开始")
	yield(animal, "animation_finished")
	label.text = "有缘再见"
	yield(get_tree().create_timer(1.0), "timeout")
	animal.play("开始")
	yield(animal, "animation_finished")
	yield(get_tree().create_timer(1.0), "timeout")
	animal.play_backwards("开始")
	get_tree().quit()
	
