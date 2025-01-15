extends Node2D

var reference_screen_size = Vector2(720, 1280)

func _ready():
	var current_screen_size = get_viewport().size

	var scale_factor = current_screen_size.x / reference_screen_size.x

	for child in get_children():
			child.scale.x *= scale_factor
			child.scale.y *= scale_factor
