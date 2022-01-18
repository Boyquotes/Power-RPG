
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
	{ 500001: { 'id': 500001,
			'前缀': '怀特',
			'前缀英文': 'WYTHE',
			'后缀': '山',
			'后缀英文': 'mountain'},
  500002: { 'id': 500002,
			'前缀': '艾伦',
			'前缀英文': 'Aaron',
			'后缀': '森林',
			'后缀英文': 'forest'},
  500003: { 'id': 500003,
			'前缀': '埃布尔',
			'前缀英文': 'Abel',
			'后缀': '沼泽',
			'后缀英文': 'swapm'},
  500004: { 'id': 500004,
			'前缀': '亚伯拉罕',
			'前缀英文': 'Abraham',
			'后缀': '湖',
			'后缀英文': 'river'},
  500005: {'id': 500005, '前缀': '亚当', '前缀英文': 'Adam', '后缀': '镇', '后缀英文': 'town'},
  500006: { 'id': 500006,
			'前缀': '艾狄生',
			'前缀英文': 'Addison',
			'后缀': '城',
			'后缀英文': 'city'},
  500007: { 'id': 500007,
			'前缀': '阿道夫',
			'前缀英文': 'Adolph',
			'后缀': '堡',
			'后缀英文': 'fort'},
  500008: { 'id': 500008,
			'前缀': '亚度尼斯',
			'前缀英文': 'Adonis',
			'后缀': '沙滩',
			'后缀英文': 'beach'}}
	return data


