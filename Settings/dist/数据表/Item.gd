
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
    {100001: {'buy_price': 100, 'desc': '脸皮要厚而无形、心要黑而无色，这样才能成为英雄豪杰。', 'id': 100001, 'name': '厚黑学香水', 'overlap': -1, 'sell_price': 100, 'type': 1, 'use_effect': 10100}, 100002: {'buy_price': 111, 'desc': '旧都的信物，庄严优雅。', 'id': 100002, 'name': '旧都信物', 'overlap': 100, 'sell_price': 1, 'type': 1, 'use_effect': 10001}, 100003: {'buy_price': 100, 'desc': '描述1', 'id': 100003, 'name': '玫瑰', 'overlap': 1, 'sell_price': 100, 'type': 1, 'use_effect': 0}, 100004: {'buy_price': 100, 'desc': '描述2', 'id': 100004, 'name': '枪', 'overlap': 1, 'sell_price': 100, 'type': 1, 'use_effect': 0}, 100005: {'buy_price': 0, 'desc': '', 'id': 100005, 'name': '谜题导论', 'overlap': 0, 'sell_price': 0, 'type': 0, 'use_effect': 0}, 100006: {'buy_price': 0, 'desc': '', 'id': 100006, 'name': '谜题多解', 'overlap': 0, 'sell_price': 0, 'type': 0, 'use_effect': 0}, 100007: {'buy_price': 0, 'desc': '', 'id': 100007, 'name': '高等谜题', 'overlap': 0, 'sell_price': 0, 'type': 0, 'use_effect': 0}, 100008: {'buy_price': 0, 'desc': '', 'id': 100008, 'name': '谜题原理', 'overlap': 0, 'sell_price': 0, 'type': 0, 'use_effect': 0}, 100009: {'buy_price': 0, 'desc': '', 'id': 100009, 'name': '九章谜题', 'overlap': 0, 'sell_price': 0, 'type': 0, 'use_effect': 0}, 100010: {'buy_price': 0, 'desc': '', 'id': 100010, 'name': '炼金术引言', 'overlap': 0, 'sell_price': 0, 'type': 0, 'use_effect': 0}, 100011: {'buy_price': 0, 'desc': '', 'id': 100011, 'name': '炼金术摘要', 'overlap': 0, 'sell_price': 0, 'type': 0, 'use_effect': 0}, 100012: {'buy_price': 0, 'desc': '', 'id': 100012, 'name': '低等炼金术', 'overlap': 0, 'sell_price': 0, 'type': 0, 'use_effect': 0}, 100013: {'buy_price': 0, 'desc': '', 'id': 100013, 'name': '中等炼金术', 'overlap': 0, 'sell_price': 0, 'type': 0, 'use_effect': 0}, 100014: {'buy_price': 0, 'desc': '', 'id': 100014, 'name': '高等炼金术', 'overlap': 0, 'sell_price': 0, 'type': 0, 'use_effect': 0}, 100015: {'buy_price': 0, 'desc': '', 'id': 100015, 'name': '炼金术原理', 'overlap': 0, 'sell_price': 0, 'type': 0, 'use_effect': 0}, 100016: {'buy_price': 0, 'desc': '', 'id': 100016, 'name': '炼金原本', 'overlap': 0, 'sell_price': 0, 'type': 0, 'use_effect': 0}}
    return data


