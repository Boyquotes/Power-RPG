
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
    {1: {'id': 1, 'name': '枪'}, 2: {'id': 2, 'name': '杖'}, 3: {'id': 3, 'name': '书'}, 4: {'id': 4, 'name': '剑'}, 5: {'id': 5, 'name': '盾'}, 6: {'id': 6, 'name': '刀'}, 7: {'id': 7, 'name': '匕首'}, 8: {'id': 8, 'name': '护符'}, 9: {'id': 9, 'name': '装备'}, 10: {'id': 10, 'name': 'add_attack'}}
    return data


