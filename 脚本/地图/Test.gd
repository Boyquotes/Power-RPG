extends Node2D

onready var tilemap = $TileMap2

func _ready():
	instance_tiles("奇遇", preload("res://资源/场景/图块/奇遇.tscn"))
	instance_tiles("BOSS", preload("res://资源/场景/图块/BOSS.tscn"))
	instance_tiles("劫匪", preload("res://资源/场景/图块/劫匪.tscn"))
	instance_tiles("商店", preload("res://资源/场景/图块/商店.tscn"))
	instance_tiles("小镇", preload("res://资源/场景/图块/小镇.tscn"))
	instance_tiles("酒馆", preload("res://资源/场景/图块/酒馆.tscn"))
	instance_tiles("驿站", preload("res://资源/场景/图块/驿站.tscn"))
	instance_tiles("丘陵", preload("res://资源/场景/图块/丘陵.tscn"))
	instance_tiles("乐手", preload("res://资源/场景/图块/乐手.tscn"))
	instance_tiles("乞丐", preload("res://资源/场景/图块/乞丐.tscn"))
	instance_tiles("冰川", preload("res://资源/场景/图块/冰川.tscn"))
	instance_tiles("森林", preload("res://资源/场景/图块/森林.tscn"))
	instance_tiles("商人", preload("res://资源/场景/图块/商人.tscn"))
	instance_tiles("商店", preload("res://资源/场景/图块/商店.tscn"))
	instance_tiles("城堡", preload("res://资源/场景/图块/城堡.tscn"))
	instance_tiles("城市", preload("res://资源/场景/图块/城市.tscn"))
	instance_tiles("大山", preload("res://资源/场景/图块/大山.tscn"))
	instance_tiles("大海", preload("res://资源/场景/图块/大海.tscn"))
	instance_tiles("学者", preload("res://资源/场景/图块/学者.tscn"))
	instance_tiles("小溪", preload("res://资源/场景/图块/小溪.tscn"))
	instance_tiles("平原", preload("res://资源/场景/图块/平原.tscn"))
	instance_tiles("怪物", preload("res://资源/场景/图块/怪物.tscn"))
	instance_tiles("沼泽", preload("res://资源/场景/图块/沼泽.tscn"))
	instance_tiles("瀑布", preload("res://资源/场景/图块/瀑布.tscn"))
	instance_tiles("火山", preload("res://资源/场景/图块/火山.tscn"))
	instance_tiles("盆地", preload("res://资源/场景/图块/盆地.tscn"))
	instance_tiles("精英", preload("res://资源/场景/图块/精英.tscn"))
	instance_tiles("荒地", preload("res://资源/场景/图块/荒地.tscn"))
	instance_tiles("诗人", preload("res://资源/场景/图块/诗人.tscn"))
	instance_tiles("陷阱", preload("res://资源/场景/图块/陷阱.tscn"))
	instance_tiles("高原", preload("res://资源/场景/图块/高原.tscn"))
	instance_tiles("人类", preload("res://资源/场景/图块/人类.tscn"))
	数据.在大地图 = true
	

func instance_tiles(tile_name, scene):
	var id = tilemap.tile_set.find_tile_by_name(tile_name)
	assert(id != -1)
	
	for pos in tilemap.get_used_cells_by_id(id):
		var node = scene.instance()
		tilemap.add_child(node)
		node.position = tilemap.map_to_world(pos) + tilemap.cell_size / 2
		tilemap.set_cellv(pos, -1)
		

func dialog():
	get_tree().call_group("dialog", "start")
	
