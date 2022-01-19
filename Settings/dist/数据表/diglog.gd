
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
	{ 700001: { 'event': 1,
			'id': 700001,
			'name': '劫匪',
			'text': '你真可悲，你什么都不是，你毫无作为，你无足轻重，你一无是处。'
			}}
	return data


