
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
    {900001: {'id': 900001, '事件名': '黑手党帮派', '事件名英文': '黑手党帮派', '事件描述': 0}, 900002: {'id': 900002, '事件名': '商贾云集', '事件名英文': '黑手党帮派', '事件描述': 0}, 900003: {'id': 900003, '事件名': '宗教活动', '事件名英文': '黑手党帮派', '事件描述': 0}, 900004: {'id': 900004, '事件名': '奇正相征', '事件名英文': '黑手党帮派', '事件描述': 0}, 900005: {'id': 900005, '事件名': '外道巢穴', '事件名英文': '黑手党帮派', '事件描述': 0}, 900006: {'id': 900006, '事件名': '生死相循', '事件名英文': '黑手党帮派', '事件描述': 0}, 900007: {'id': 900007, '事件名': '比武招亲', '事件名英文': '黑手党帮派', '事件描述': 0}, 900008: {'id': 900008, '事件名': '寻找蓝孔雀', '事件名英文': '黑手党帮派', '事件描述': 0}, 900009: {'id': 900009, '事件名': '寻找神照石', '事件名英文': '黑手党帮派', '事件描述': 0}, 900010: {'id': 900010, '事件名': '寻找断肠草', '事件名英文': '黑手党帮派', '事件描述': 0}, 900011: {'id': 900011, '事件名': '手枪增幅', '事件名英文': '', '事件描述': 0}, 900012: {'id': 900012, '事件名': '霰弹枪增幅', '事件名英文': '', '事件描述': 0}, 900013: {'id': 900013, '事件名': '钢铁充能', '事件名英文': '', '事件描述': 0}, 900014: {'id': 900014, '事件名': '近战指引', '事件名英文': '', '事件描述': 0}, 900015: {'id': 900015, '事件名': '献出力量', '事件名英文': '', '事件描述': 0}, 900016: {'id': 900016, '事件名': '成长之力', '事件名英文': '', '事件描述': 0}, 900017: {'id': 900017, '事件名': '死亡之眼', '事件名英文': '', '事件描述': 0}, 900018: {'id': 900018, '事件名': '迅敏动量', '事件名英文': '', '事件描述': 0}, 900019: {'id': 900019, '事件名': '步枪增幅', '事件名英文': '', '事件描述': 0}, 900020: {'id': 900020, '事件名': '体魄', '事件名英文': '', '事件描述': 0}, 900021: {'id': 900021, '事件名': '战斗教条', '事件名英文': '', '事件描述': 0}, 900022: {'id': 900022, '事件名': '团结一致', '事件名英文': '', '事件描述': 0}, 900023: {'id': 900023, '事件名': '牧羊人', '事件名英文': '', '事件描述': 0}, 900024: {'id': 900024, '事件名': '返老还童', '事件名英文': '', '事件描述': 0}, 900025: {'id': 900025, '事件名': '空气动力', '事件名英文': '', '事件描述': 0}, 900026: {'id': 900026, '事件名': '毒素抵抗', '事件名英文': '', '事件描述': 0}, 900027: {'id': 900027, '事件名': '感染者阻抗', '事件名英文': '', '事件描述': 0}, 900028: {'id': 900028, '事件名': '电磁脉冲场', '事件名英文': '', '事件描述': 0}, 900029: {'id': 900029, '事件名': '切换增幅', '事件名英文': '', '事件描述': 0}, 900030: {'id': 900030, '事件名': '腐蚀投射', '事件名英文': '', '事件描述': 0}, 900031: {'id': 900031, '事件名': '能量虹吸', '事件名英文': '', '事件描述': 0}, 900032: {'id': 900032, '事件名': '侦敌雷达', '事件名英文': '', '事件描述': 0}, 900033: {'id': 900033, '事件名': '经验增幅', '事件名英文': '', '事件描述': 0}, 900034: {'id': 900034, '事件名': '战利品探测器', '事件名英文': '', '事件描述': 0}, 900035: {'id': 900035, '事件名': '冲刺提升', '事件名英文': '', '事件描述': 0}, 900036: {'id': 900036, '事件名': '机甲强化', '事件名英文': '', '事件描述': 0}, 900037: {'id': 900037, '事件名': '手枪弹药搜集者', '事件名英文': '', '事件描述': 0}, 900038: {'id': 900038, '事件名': '步枪弹药搜集者', '事件名英文': '', '事件描述': 0}, 900039: {'id': 900039, '事件名': '狙击枪弹药搜集者', '事件名英文': '', '事件描述': 0}, 900040: {'id': 900040, '事件名': '霰弹枪弹药搜集者', '事件名英文': '', '事件描述': 0}, 900041: {'id': 900041, '事件名': '护盾瓦解', '事件名英文': '', '事件描述': 0}, 900042: {'id': 900042, '事件名': '强化刀锋', '事件名英文': '', '事件描述': 0}, 900043: {'id': 900043, '事件名': '快速休整', '事件名英文': '', '事件描述': 0}, 900044: {'id': 900044, '事件名': '合成反射', '事件名英文': '', '事件描述': 0}, 900045: {'id': 900045, '事件名': '撕裂翻转', '事件名英文': '', '事件描述': 0}, 900046: {'id': 900046, '事件名': '速度窜升', '事件名英文': '', '事件描述': 0}, 900047: {'id': 900047, '事件名': '火焰行者', '事件名英文': '', '事件描述': 0}, 900048: {'id': 900048, '事件名': '狡诈窜升', '事件名英文': '', '事件描述': 0}, 900049: {'id': 900049, '事件名': '电光冲刺', '事件名英文': '', '事件描述': 0}, 900050: {'id': 900050, '事件名': '保温服', '事件名英文': '', '事件描述': 0}, 900051: {'id': 900051, '事件名': '飞行员（MOD）', '事件名英文': '', '事件描述': 0}, 900052: {'id': 900052, '事件名': '机动冲撞', '事件名英文': '', '事件描述': 0}, 900053: {'id': 900053, '事件名': '矫捷窜升', '事件名英文': '', '事件描述': 0}, 900054: {'id': 900054, '事件名': '顶天立地', '事件名英文': '', '事件描述': 0}, 900055: {'id': 900055, '事件名': '惩戒', '事件名英文': '', '事件描述': 0}, 900056: {'id': 900056, '事件名': '冰冷跃动', '事件名英文': '', '事件描述': 0}, 900057: {'id': 900057, '事件名': '狂风猛踢', '事件名英文': '', '事件描述': 0}, 900058: {'id': 900058, '事件名': '剧毒飞腾', '事件名英文': '', '事件描述': 0}, 900059: {'id': 900059, '事件名': '私法追踪', '事件名英文': '', '事件描述': 0}, 900060: {'id': 900060, '事件名': '痛苦阈值', '事件名英文': '', '事件描述': 0}, 900061: {'id': 900061, '事件名': '空飞俯瞰', '事件名英文': '', '事件描述': 0}, 900062: {'id': 900062, '事件名': '全面驱动', '事件名英文': '', '事件描述': 0}, 900063: {'id': 900063, '事件名': '翻筋斗', '事件名英文': '', '事件描述': 0}, 900064: {'id': 900064, '事件名': '花开怪奇', '事件名英文': '', '事件描述': 0}, 900065: {'id': 900065, '事件名': '质子脉动', '事件名英文': '', '事件描述': 0}, 900066: {'id': 900066, '事件名': '震地冲击', '事件名英文': '', '事件描述': 0}, 900067: {'id': 900067, '事件名': '观众怪奇', '事件名英文': '', '事件描述': 0}, 900068: {'id': 900068, '事件名': '磁浮', '事件名英文': '', '事件描述': 0}, 900069: {'id': 900069, '事件名': '冲刺', '事件名英文': '', '事件描述': 0}, 900070: {'id': 900070, '事件名': '匿踪窜升', '事件名英文': '', '事件描述': 0}, 900071: {'id': 900071, '事件名': '跃动信号', '事件名英文': '', '事件描述': 0}, 900072: {'id': 900072, '事件名': '生长怪奇', '事件名英文': '', '事件描述': 0}, 900073: {'id': 900073, '事件名': '盗贼大师', '事件名英文': '', '事件描述': 0}, 900074: {'id': 900074, '事件名': '协力窜升', '事件名英文': '', '事件描述': 0}, 900075: {'id': 900075, '事件名': '流线外形', '事件名英文': '', '事件描述': 0}, 900076: {'id': 900076, '事件名': '盗贼天赋', '事件名英文': '', '事件描述': 0}, 900077: {'id': 900077, '事件名': '穿刺步伐', '事件名英文': '', '事件描述': 0}, 900078: {'id': 900078, '事件名': '翼膜', '事件名英文': '', '事件描述': 0}, 900079: {'id': 900079, '事件名': '敌人感应', '事件名英文': '', '事件描述': 0}, 900080: {'id': 900080, '事件名': '库娃的优雅', '事件名英文': '', '事件描述': 0}, 900081: {'id': 900081, '事件名': '坚忍窜升', '事件名英文': '', '事件描述': 0}, 900082: {'id': 900082, '事件名': '有备而来', '事件名英文': '', '事件描述': 0}, 900083: {'id': 900083, '事件名': '力量窜升', '事件名英文': '', '事件描述': 0}, 900084: {'id': 900084, '事件名': '猎人肾上腺素', '事件名英文': '黑手党帮派', '事件描述': 0}, 900085: {'id': 900085, '事件名': '聚精会神', '事件名英文': '黑手党帮派', '事件描述': 0}, 900086: {'id': 900086, '事件名': '执刑官聚精会神', '事件名英文': '黑手党帮派', '事件描述': 0}, 900087: {'id': 900087, '事件名': '执刑官持久力', '事件名英文': '黑手党帮派', '事件描述': 0}, 900088: {'id': 900088, '事件名': '激怒', '事件名英文': '黑手党帮派', '事件描述': 0}, 900089: {'id': 900089, '事件名': '持久力', '事件名英文': '黑手党帮派', '事件描述': 0}, 900090: {'id': 900090, '事件名': '盲怒', '事件名英文': '黑手党帮派', '事件描述': 0}, 900091: {'id': 900091, '事件名': '能量转换', '事件名英文': '黑手党帮派', '事件描述': 0}, 900092: {'id': 900092, '事件名': '狂暴化', '事件名英文': '黑手党帮派', '事件描述': 0}, 900093: {'id': 900093, '事件名': '技法连带', '事件名英文': '黑手党帮派', '事件描述': 0}, 900094: {'id': 900094, '事件名': '机甲脉冲', '事件名英文': '黑手党帮派', '事件描述': 0}, 900095: {'id': 900095, '事件名': '瞬时坚毅', '事件名英文': '黑手党帮派', '事件描述': 0}, 900096: {'id': 900096, '事件名': '适应', '事件名英文': '黑手党帮派', '事件描述': 0}, 900097: {'id': 900097, '事件名': '预言协约', '事件名英文': '黑手党帮派', '事件描述': 0}, 900098: {'id': 900098, '事件名': '执刑官生命力', '事件名英文': '黑手党帮派', '事件描述': 0}, 900099: {'id': 900099, '事件名': '反射防御', '事件名英文': '黑手党帮派', '事件描述': 0}, 900100: {'id': 900100, '事件名': '充能反弹', '事件名英文': '黑手党帮派', '事件描述': 0}, 900101: {'id': 900101, '事件名': '角斗士灵巧', '事件名英文': '黑手党帮派', '事件描述': 0}, 900102: {'id': 900102, '事件名': '快速充能', '事件名英文': '黑手党帮派', '事件描述': 0}, 900103: {'id': 900103, '事件名': '生命转换', '事件名英文': '黑手党帮派', '事件描述': 0}, 900104: {'id': 900104, '事件名': '活力', '事件名英文': '黑手党帮派', '事件描述': 0}, 900105: {'id': 900105, '事件名': '减震器', '事件名英文': '黑手党帮派', '事件描述': 0}, 900106: {'id': 900106, '事件名': '灵活装甲', '事件名英文': '黑手党帮派', '事件描述': 0}, 900107: {'id': 900107, '事件名': '毒抗', '事件名英文': '黑手党帮派', '事件描述': 0}, 900108: {'id': 900108, '事件名': '极速复元', '事件名英文': '黑手党帮派', '事件描述': 0}, 900109: {'id': 900109, '事件名': '角斗士决心', '事件名英文': '黑手党帮派', '事件描述': 0}, 900110: {'id': 900110, '事件名': '过度延展', '事件名英文': '黑手党帮派', '事件描述': 0}, 900111: {'id': 900111, '事件名': '心志偏狭', '事件名英文': '黑手党帮派', '事件描述': 0}, 900112: {'id': 900112, '事件名': '蓄能重划', '事件名英文': '黑手党帮派', '事件描述': 0}, 900113: {'id': 900113, '事件名': '随机应变', '事件名英文': '黑手党帮派', '事件描述': 0}, 900114: {'id': 900114, '事件名': '喉骨刃者壳甲', '事件名英文': '黑手党帮派', '事件描述': 0}, 900115: {'id': 900115, '事件名': '生命力', '事件名英文': '黑手党帮派', '事件描述': 0}, 900116: {'id': 900116, '事件名': '私法活力', '事件名英文': '黑手党帮派', '事件描述': 0}, 900117: {'id': 900117, '事件名': '不朽意志', '事件名英文': '黑手党帮派', '事件描述': 0}, 900118: {'id': 900118, '事件名': '肉碾虫壳甲', '事件名英文': '黑手党帮派', '事件描述': 0}, 900119: {'id': 900119, '事件名': '钢铁纤维', '事件名英文': '黑手党帮派', '事件描述': 0}, 900120: {'id': 900120, '事件名': '重岩者壳甲', '事件名英文': '黑手党帮派', '事件描述': 0}, 900121: {'id': 900121, '事件名': '翻滚防护', '事件名英文': '黑手党帮派', '事件描述': 0}, 900122: {'id': 900122, '事件名': '隔热', '事件名英文': '黑手党帮派', '事件描述': 0}, 900123: {'id': 900123, '事件名': '弹性焦点', '事件名英文': '黑手党帮派', '事件描述': 0}, 900124: {'id': 900124, '事件名': '火焰防护', '事件名英文': '黑手党帮派', '事件描述': 0}, 900125: {'id': 900125, '事件名': '钻石皮肤', '事件名英文': '黑手党帮派', '事件描述': 0}, 900126: {'id': 900126, '事件名': '避雷针', '事件名英文': '黑手党帮派', '事件描述': 0}, 900127: {'id': 900127, '事件名': '角斗士圣盾', '事件名英文': '黑手党帮派', '事件描述': 0}, 900128: {'id': 900128, '事件名': '预言通灵', '事件名英文': '黑手党帮派', '事件描述': 0}, 900129: {'id': 900129, '事件名': '均衡点', '事件名英文': '黑手党帮派', '事件描述': 0}, 900130: {'id': 900130, '事件名': '执刑官川流不息', '事件名英文': '黑手党帮派', '事件描述': 0}, 900131: {'id': 900131, '事件名': '不屈不挠', '事件名英文': '黑手党帮派', '事件描述': 0}, 900132: {'id': 900132, '事件名': '预言启示', '事件名英文': '黑手党帮派', '事件描述': 0}, 900133: {'id': 900133, '事件名': '强力切换', '事件名英文': '黑手党帮派', '事件描述': 0}, 900134: {'id': 900134, '事件名': '天赋', '事件名英文': '黑手党帮派', '事件描述': 0}, 900135: {'id': 900135, '事件名': '弹指瞬技', '事件名英文': '黑手党帮派', '事件描述': 0}, 900136: {'id': 900136, '事件名': '延伸', '事件名英文': '黑手党帮派', '事件描述': 0}, 900137: {'id': 900137, '事件名': '菌株吸收', '事件名英文': '黑手党帮派', '事件描述': 0}, 900138: {'id': 900138, '事件名': '百折不挠', '事件名英文': '黑手党帮派', '事件描述': 0}, 900139: {'id': 900139, '事件名': '川流不息', '事件名英文': '黑手党帮派', '事件描述': 0}, 900140: {'id': 900140, '事件名': '执刑官延伸', '事件名英文': '黑手党帮派', '事件描述': 0}, 900141: {'id': 900141, '事件名': '简化', '事件名英文': '黑手党帮派', '事件描述': 0}, 900142: {'id': 900142, '事件名': '均衡点', '事件名英文': '黑手党帮派', '事件描述': 0}, 900143: {'id': 900143, '事件名': '预言神密', '事件名英文': '黑手党帮派', '事件描述': 0}, 900144: {'id': 900144, '事件名': '暗影聚精会神', '事件名英文': '黑手党帮派', '事件描述': 0}, 900145: {'id': 900145, '事件名': '暗影纤维', '事件名英文': '黑手党帮派', '事件描述': 0}, 900146: {'id': 900146, '事件名': '暗影生命力', '事件名英文': '黑手党帮派', '事件描述': 0}, 900147: {'id': 900147, '事件名': '事件145', '事件名英文': '黑手党帮派', '事件描述': 0}, 900148: {'id': 900148, '事件名': '事件146', '事件名英文': '黑手党帮派', '事件描述': 0}, 900149: {'id': 900149, '事件名': '事件147', '事件名英文': '黑手党帮派', '事件描述': 0}, 900150: {'id': 900150, '事件名': '事件148', '事件名英文': '黑手党帮派', '事件描述': 0}, 900151: {'id': 900151, '事件名': '事件149', '事件名英文': '黑手党帮派', '事件描述': 0}, 900152: {'id': 900152, '事件名': '事件150', '事件名英文': '黑手党帮派', '事件描述': 0}, 900153: {'id': 900153, '事件名': '事件151', '事件名英文': '黑手党帮派', '事件描述': 0}, 900154: {'id': 900154, '事件名': '事件152', '事件名英文': '黑手党帮派', '事件描述': 0}, 900155: {'id': 900155, '事件名': '事件153', '事件名英文': '黑手党帮派', '事件描述': 0}, 900156: {'id': 900156, '事件名': '事件154', '事件名英文': '黑手党帮派', '事件描述': 0}, 900157: {'id': 900157, '事件名': '事件155', '事件名英文': '黑手党帮派', '事件描述': 0}, 900158: {'id': 900158, '事件名': '事件156', '事件名英文': '黑手党帮派', '事件描述': 0}, 900159: {'id': 900159, '事件名': '事件157', '事件名英文': '黑手党帮派', '事件描述': 0}, 900160: {'id': 900160, '事件名': '事件158', '事件名英文': '黑手党帮派', '事件描述': 0}, 900161: {'id': 900161, '事件名': '事件159', '事件名英文': '黑手党帮派', '事件描述': 0}, 900162: {'id': 900162, '事件名': '事件160', '事件名英文': '黑手党帮派', '事件描述': 0}, 900163: {'id': 900163, '事件名': '事件161', '事件名英文': '黑手党帮派', '事件描述': 0}, 900164: {'id': 900164, '事件名': '事件162', '事件名英文': '黑手党帮派', '事件描述': 0}, 900165: {'id': 900165, '事件名': '事件163', '事件名英文': '黑手党帮派', '事件描述': 0}, 900166: {'id': 900166, '事件名': '事件164', '事件名英文': '黑手党帮派', '事件描述': 0}, 900167: {'id': 900167, '事件名': '事件165', '事件名英文': '黑手党帮派', '事件描述': 0}, 900168: {'id': 900168, '事件名': '事件166', '事件名英文': '黑手党帮派', '事件描述': 0}, 900169: {'id': 900169, '事件名': '事件167', '事件名英文': '黑手党帮派', '事件描述': 0}, 900170: {'id': 900170, '事件名': '事件168', '事件名英文': '黑手党帮派', '事件描述': 0}, 900171: {'id': 900171, '事件名': '事件169', '事件名英文': '黑手党帮派', '事件描述': 0}, 900172: {'id': 900172, '事件名': '事件170', '事件名英文': '黑手党帮派', '事件描述': 0}, 900173: {'id': 900173, '事件名': '事件171', '事件名英文': '黑手党帮派', '事件描述': 0}, 900174: {'id': 900174, '事件名': '事件172', '事件名英文': '黑手党帮派', '事件描述': 0}, 900175: {'id': 900175, '事件名': '事件173', '事件名英文': '黑手党帮派', '事件描述': 0}, 900176: {'id': 900176, '事件名': '事件174', '事件名英文': '黑手党帮派', '事件描述': 0}, 900177: {'id': 900177, '事件名': '事件175', '事件名英文': '黑手党帮派', '事件描述': 0}, 900178: {'id': 900178, '事件名': '事件176', '事件名英文': '黑手党帮派', '事件描述': 0}, 900179: {'id': 900179, '事件名': '事件177', '事件名英文': '黑手党帮派', '事件描述': 0}, 900180: {'id': 900180, '事件名': '事件178', '事件名英文': '黑手党帮派', '事件描述': 0}, 900181: {'id': 900181, '事件名': '事件179', '事件名英文': '黑手党帮派', '事件描述': 0}, 900182: {'id': 900182, '事件名': '事件180', '事件名英文': '黑手党帮派', '事件描述': 0}, 900183: {'id': 900183, '事件名': '事件181', '事件名英文': '黑手党帮派', '事件描述': 0}, 900184: {'id': 900184, '事件名': '事件182', '事件名英文': '黑手党帮派', '事件描述': 0}}
    return data


