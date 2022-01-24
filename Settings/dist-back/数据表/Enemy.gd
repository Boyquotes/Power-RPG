
extends Reference
class Function extends Reference:

	var func_name
	var script_path

	func _init(script_path, func_name):
		self.func_name = func_name
		self.script_path = script_path

	func call(args=[]):
		var this_script = load(script_path)
		return this_script.call(self.func_name, args)

static func data():
	var None = null
	var False = false
	var True = true

	var data = \
	{ 400001: { ' hp': 999,
			'mp': 999,
			'attack': 999,
			'defense': 999,
			'speed': 5,
			'desc': '一个彻彻底底的坏蛋',
			'id': 400001,
			'img': 'res://资源/图片/立绘/主角小.png',
			'name': 'RUI·陈',
			'type': 1}}
	return data


