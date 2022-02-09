tool
extends Goal


export(String) var x_title = "X"
export(String) var y_title = "Y"

export(int) var x = 0 setget set_numerator
export(int) var y = 0 setget set_denominator

export(bool) var can_go_over = false

func set_numerator(new_value : int) -> void:
	x = new_value
	update()

func set_denominator(new_value : int) -> void:
	y = new_value
	update()

func update() -> void:
	if can_go_over:
		set_completion(x >= y)
	else:
		set_completion(x == y)

func get_completion_percentage() -> float:
	return float(x) / float(y)
