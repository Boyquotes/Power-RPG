extends CanvasLayer

onready var ract = $ColorRect
onready var animal = $AnimationPlayer

func changer(path):
	ract.show()
	animal.play("过渡")
	yield(animal, "animation_finished")
	get_tree().change_scene(path)
	animal.play_backwards("过渡")
	yield(animal, "animation_finished")
	ract.hide()
	
