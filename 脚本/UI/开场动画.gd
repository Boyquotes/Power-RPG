extends Control

func _ready():
	Uhd.get_node("UI").hide()
	$AnimationPlayer.play("show")
	yield($AnimationPlayer, "animation_finished")
	changer_scence.changer("res://资源/场景/UI/主界面.tscn")
