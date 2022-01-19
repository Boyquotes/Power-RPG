
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
	{ 200001: { 'buy_price': 100,
			'desc': '枪柄上印着玫瑰派的手枪。\n\n明明是很普通的手枪，却广为流行，和枪柄上的文字有什么关联吗？',
			'id': 200001,
			'name': '玫瑰派',
			'overlap': 1,
			'sell_price': 100,
			'set': 0,
			'type': 1,
			'use_effect': 0}}
	return data


