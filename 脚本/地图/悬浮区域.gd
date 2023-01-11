extends Button

func _make_custom_tooltip(for_text):
	print("悬浮了0")
#	get_tree().call_group("图块", "更新信息框")
	var tooltip = preload("res://资源/场景/UI/悬浮信息框.tscn").instance()
#	tooltip.set_custom_minimum_size(10, 10)
	print("悬浮了1")
	tooltip.get_node("Panel/Vbox/Vbox2/NPC/标题").text = for_text
	tooltip.rect_min_size = Vector2(200, 300)
	print("悬浮了2")
	return tooltip
	



func _on_悬浮区域_mouse_entered():
	print("Tooltip")
	_make_custom_tooltip("iii")
