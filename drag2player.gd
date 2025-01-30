extends Node2D


@onready var top_node = get_node("/root/Node2D/Paddle2/Sprite2D")
@onready var bottom_node = get_node("/root/Node2D/Paddle/Sprite2D")

var screen_height: float = 0
var active_drags = {}

func _ready():
	screen_height = get_viewport().size.y
	print("Screen height:", screen_height)

func _input(event):
	if event is InputEventScreenTouch:
		if event.pressed:
			active_drags[event.index] = event.position
			print("Touch started:", event.index, event.position)
		else:
			active_drags.erase(event.index)
			print("Touch ended:", event.index)

	elif event is InputEventScreenDrag:
		if event.index in active_drags:
			_move_node(event.index, event.position)

func _move_node(index: int, position: Vector2):
	var delta = position - active_drags[index]
	if position.y < screen_height / 2:
		top_node.position += delta
		print("Touch", index, "moving TOP Node2D to", top_node.position)
	else:
		bottom_node.position += delta
		print("Touch", index, "moving BOTTOM Node2D to", bottom_node.position)
	active_drags[index] = position
