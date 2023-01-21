tool
extends GraphNode

func _on_BaseNode_close_request():
	queue_free()

func _on_BaseNode_resize_request(new_minsize):
	rect_size = new_minsize
