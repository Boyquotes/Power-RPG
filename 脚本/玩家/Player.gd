extends Node2D

func get_local_pos():
	var player_pos = self.position
	var local_pos = self.to_local(player_pos)
	return local_pos
