
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
    {300001: {'attack': 999, 'desc': '跳脸攻击', 'id': 300001, 'name': '跳脸攻击'}, 300002: {'attack': 1000, 'desc': '死亡咏唱', 'id': 300002, 'name': '死亡咏唱'}, 300003: {'attack': 1001, 'desc': '遗物', 'id': 300003, 'name': '遗物'}, 300004: {'attack': 1002, 'desc': '燕归巢', 'id': 300004, 'name': '燕归巢'}, 300005: {'attack': 1003, 'desc': '苦痛', 'id': 300005, 'name': '苦痛'}, 300006: {'attack': 1004, 'desc': '神力', 'id': 300006, 'name': '神力'}, 300007: {'attack': 1005, 'desc': '戈多', 'id': 300007, 'name': '戈多'}, 300008: {'attack': 1006, 'desc': '无足轻重', 'id': 300008, 'name': '无足轻重'}, 300009: {'attack': 1007, 'desc': '尤尼缇', 'id': 300009, 'name': '尤尼缇'}, 300010: {'attack': 1008, 'desc': '海风', 'id': 300010, 'name': '海风'}}
    return data


