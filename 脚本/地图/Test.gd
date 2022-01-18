extends Node2D

onready var tilemap = $TileMap2

func _ready():
	instance_tiles("奇遇", preload("res://资源/场景/图块/奇遇.tscn"))
	
func instance_tiles(tile_name, scene):
	var id = tilemap.tile_set.find_tile_by_name(tile_name)
	assert(id != -1)
	
	for pos in tilemap.get_used_cells_by_id(id):
		var node = scene.instance()
		tilemap.add_child(node)
		node.position = tilemap.map_to_world(pos) + tilemap.cell_size / 2
		tilemap.set_cellv(pos, -1)
		

