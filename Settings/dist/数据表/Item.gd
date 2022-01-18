
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
    { 100001: { 'buy_price': 100,
            'desc': '脸皮要厚而无形、心要黑而无色，这样才能成为英雄豪杰。',
            'id': 100001,
            'name': '厚黑学香水',
            'overlap': -1,
            'sell_price': 100,
            'type': 1,
            'use_effect': 1},
  100002: { 'buy_price': 111,
            'desc': '飞蝗石，可以扔向敌人',
            'id': 100002,
            'name': '石头',
            'overlap': 100,
            'sell_price': 1,
            'type': 1,
            'use_effect': 10001},
  100003: { 'buy_price': 100,
            'desc': '描述1',
            'id': 100003,
            'name': '玫瑰',
            'overlap': 1,
            'sell_price': 100,
            'type': 1,
            'use_effect': 0},
  100004: { 'buy_price': 100,
            'desc': '描述2',
            'id': 100004,
            'name': '枪',
            'overlap': 1,
            'sell_price': 100,
            'type': 1,
            'use_effect': 0}}
    return data


