
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
    {200001: {'attack': 1, 'defence': 1, 'desc': '玫瑰', 'id': 200001, 'name': '玫瑰派', 'speed': 1, 'suit': 0, 'type': 1}, 200002: {'attack': 1, 'defence': 1, 'desc': '空', 'id': 200002, 'name': '黑红礼赞', 'speed': 1, 'suit': 0, 'type': 0}, 200003: {'attack': 1, 'defence': 1, 'desc': '空', 'id': 200003, 'name': '王权无续', 'speed': 1, 'suit': 0, 'type': 0}, 200004: {'attack': 1, 'defence': 1, 'desc': '空', 'id': 200004, 'name': '哈哈', 'speed': 1, 'suit': 0, 'type': 0}}
    return data


