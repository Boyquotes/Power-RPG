extends Control

func 增加行动点():
	get_tree().call_group("行动点容器", "添加行动点")
