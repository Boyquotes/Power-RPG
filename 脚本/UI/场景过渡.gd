extends CanvasLayer

onready var ract = $ColorRect
onready var animal = $AnimationPlayer

func _ready():
	ract.hide()
	animal.play("RESET")

func changer(path, _dialog):
	ract.show()
	animal.play("过渡")
	yield(animal, "animation_finished")
	get_tree().change_scene(path)
	animal.play_backwards("过渡")
	yield(animal, "animation_finished")
	ract.hide()
	
