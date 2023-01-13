
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
    {200001: {'attack': 67, 'defence': 1, 'desc': '玫瑰', 'icon': 'res://资源/图片/UI/icon/香水.png', 'id': 200001, 'lucky': 12, 'name': '玫瑰派', 'speed': 1, 'type': 'Weapons', 'value': 456, 'weight': 21}, 200002: {'attack': 778, 'defence': 54, 'desc': '空', 'icon': 'res://资源/图片/UI/icon/手枪.png', 'id': 200002, 'lucky': 13, 'name': '黑红礼赞', 'speed': 1, 'type': 'Weapons', 'value': 135, 'weight': 45}, 200003: {'attack': 4545, 'defence': 799, 'desc': '空', 'icon': 'res://资源/图片/UI/icon/手枪.png', 'id': 200003, 'lucky': 14, 'name': '王权无续', 'speed': 87, 'type': 'Weapons', 'value': 98, 'weight': 14}, 200004: {'attack': 46, 'defence': 467, 'desc': '空', 'icon': 'res://资源/图片/UI/icon/手枪.png', 'id': 200004, 'lucky': 15, 'name': '童话故事', 'speed': 1, 'type': 'Weapons', 'value': 214, 'weight': 20}, 200005: {'attack': 2, 'defence': 468, 'desc': '空', 'icon': 'res://资源/图片/UI/icon/手枪.png', 'id': 200005, 'lucky': 16, 'name': '圣克鲁卷轴', 'speed': 2, 'type': 'Weapons', 'value': 215, 'weight': 21}, 200006: {'attack': 3, 'defence': 469, 'desc': '空', 'icon': 'res://资源/图片/UI/icon/手枪.png', 'id': 200006, 'lucky': 17, 'name': '圣佩德罗剑', 'speed': 3, 'type': 'Weapons', 'value': 216, 'weight': 22}, 200007: {'attack': 4, 'defence': 470, 'desc': '空', 'icon': 'res://资源/图片/UI/icon/手枪.png', 'id': 200007, 'lucky': 18, 'name': '莱斯港枪', 'speed': 4, 'type': 'Weapons', 'value': 217, 'weight': 23}, 200008: {'attack': 5, 'defence': 471, 'desc': '空', 'icon': 'res://资源/图片/UI/icon/手枪.png', 'id': 200008, 'lucky': 19, 'name': '旧都自由光辉', 'speed': 5, 'type': 'Weapons', 'value': 218, 'weight': 24}, 200009: {'attack': 6, 'defence': 472, 'desc': '空', 'icon': 'res://资源/图片/UI/icon/手枪.png', 'id': 200009, 'lucky': 20, 'name': '海牙', 'speed': 6, 'type': 'Weapons', 'value': 219, 'weight': 25}, 200010: {'attack': 7, 'defence': 473, 'desc': '空', 'icon': 'res://资源/图片/UI/icon/手枪.png', 'id': 200010, 'lucky': 21, 'name': '牧羊之诗', 'speed': 7, 'type': 'Weapons', 'value': 220, 'weight': 26}, 200011: {'attack': 8, 'defence': 474, 'desc': '空', 'icon': 'res://资源/图片/UI/icon/手枪.png', 'id': 200011, 'lucky': 22, 'name': '灯火竹帘', 'speed': 8, 'type': 'Weapons', 'value': 221, 'weight': 27}, 200012: {'attack': 9, 'defence': 475, 'desc': '空', 'icon': 'res://资源/图片/UI/icon/手枪.png', 'id': 200012, 'lucky': 23, 'name': '冷刀', 'speed': 9, 'type': 'Weapons', 'value': 222, 'weight': 28}, 200013: {'attack': 10, 'defence': 476, 'desc': '空', 'icon': 'res://资源/图片/UI/icon/手枪.png', 'id': 200013, 'lucky': 24, 'name': '冷剑', 'speed': 10, 'type': 'Weapons', 'value': 223, 'weight': 29}, 200014: {'attack': 11, 'defence': 477, 'desc': '空', 'icon': 'res://资源/图片/UI/icon/手枪.png', 'id': 200014, 'lucky': 25, 'name': '冷弓', 'speed': 11, 'type': 'Weapons', 'value': 224, 'weight': 30}}
    return data


