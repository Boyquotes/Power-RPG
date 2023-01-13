
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
    {800001: {'attack': 0, 'desc': '独属英雄的时代。', 'id': 800001, 'name': '英雄时代', 'type': 8}, 800002: {'attack': 0, 'desc': '羊群拥抱着我，彩云拥抱着太阳。', 'id': 800002, 'name': '牧羊诗人', 'type': 8}, 800003: {'attack': 0, 'desc': '心灵同红宝石般闪闪。', 'id': 800003, 'name': '红宝石', 'type': 8}, 800004: {'attack': 0, 'desc': '', 'id': 800004, 'name': '白痴王', 'type': 8}, 800005: {'attack': 0, 'desc': '游牧时代的遗物。', 'id': 800005, 'name': '玫瑰守护', 'type': 8}, 800006: {'attack': 0, 'desc': '', 'id': 800006, 'name': '海牙之风', 'type': 8}, 800007: {'attack': 0, 'desc': '', 'id': 800007, 'name': '旧都光辉', 'type': 8}, 800008: {'attack': 0, 'desc': '“One Shot。”', 'id': 800008, 'name': '一发左轮', 'type': 8}, 800009: {'attack': 0, 'desc': '', 'id': 800009, 'name': '子弹时间', 'type': 8}, 800010: {'attack': 0, 'desc': '马卡斯团长的祝福。', 'id': 800010, 'name': '剑术好手', 'type': 8}, 800011: {'attack': 0, 'desc': '', 'id': 800011, 'name': '王权', 'type': 8}, 800012: {'attack': 0, 'desc': '直言不讳的勇敢与百折不挠的真诚。', 'id': 800012, 'name': '亚度尼斯的左剑', 'type': 8}, 800013: {'attack': 0, 'desc': '', 'id': 800013, 'name': '高速通缉', 'type': 8}, 800014: {'attack': 0, 'desc': '', 'id': 800014, 'name': '远洋士', 'type': 8}, 800015: {'attack': 0, 'desc': '', 'id': 800015, 'name': '流浪礼赞', 'type': 8}, 800016: {'attack': 0, 'desc': '', 'id': 800016, 'name': '枪法名人', 'type': 8}, 800017: {'attack': 0, 'desc': '', 'id': 800017, 'name': '誓言', 'type': 8}, 800018: {'attack': 0, 'desc': '', 'id': 800018, 'name': '癔症', 'type': 8}, 800019: {'attack': 0, 'desc': '', 'id': 800019, 'name': '狡黠', 'type': 8}, 800020: {'attack': 0, 'desc': '', 'id': 800020, 'name': '八面玲珑', 'type': 8}, 800021: {'attack': 0, 'desc': '', 'id': 800021, 'name': '帕特里克烈火', 'type': 8}, 800022: {'attack': 0, 'desc': '', 'id': 800022, 'name': '托拜厄斯的诅咒', 'type': 8}}
    return data


