extends Node2D

func _on_格子模板_body_entered(body):
	var name = self.name
	print("撞上了" + name)
	pass
