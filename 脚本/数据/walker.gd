extends Node

class_name Walker



#func _init():
#	randomize()
#	for i in 生成图块数:
#		xx = randi()%长+1
#		yy = randi()%宽+1
#		print("生成图块")
		




#const 方向常量 = [Vector2.RIGHT, Vector2.UP, Vector2.LEFT, Vector2.DOWN]
#
#var 位置 = Vector2.ZERO
#var 方向变量 = Vector2.RIGHT
#var 边界 = Rect2()
#var 生成历史 = []
#var 第一步 = 0
#
##正常
#func _init(开始位置, 新边界):
#	Print.line(Print.BLACK + Print.WHITE_BACKGROUND, "开始初始化")
#	assert(新边界.has_point(开始位置))
#	位置 = 开始位置
#	生成历史.append(位置)
#	边界 = 新边界
#	Print.line(Print.BLACK + Print.WHITE_BACKGROUND, "初始化完毕")
#
##正常
#func walk(步骤们):
#	for 步骤 in 步骤们:
#		print("正常吗")
#		if randf() <= 0.5 or 第一步 >= 4:
#			print("正常吗2")
#			转弯()
#		if 步骤():
#			print("正常吗3")
#			生成历史.append(位置)
#		else:
#			print("正常吗4")
#			转弯()
#	return 生成历史
#
#
##正常
#func 步骤():
#	var 目标位置 = 位置 + 方向变量
#	if 边界.has_point(目标位置):
#		第一步 += 1
#		位置 = 目标位置
#		return true
#	else:
#		return false
#
#func 转弯():
#	第一步 = 0
#	var 方向们 = 方向常量.duplicate()
#	方向们.erase(方向变量)
#	方向们.shuffle()
#	方向变量 = 方向们.pop_front()
#	while not 边界.has_point(位置 + 方向变量):
#		print("正常")
#		方向变量 = 方向们.pop_front()
