extends Node2D

var left_bound : Node2D
var right_bound : Node2D
var top_bound : Node2D
var bottom_bound : Node2D
var screen_size : Vector2
var col : CollisionShape2D
var sprite : Sprite2D

func _ready():
	screen_size = get_viewport().get_visible_rect().size
	left_bound = get_node("/root/Node2D/Boundaries/LeftBound/")
	right_bound = get_node("/root/Node2D/Boundaries/RightBound/")
	top_bound = get_node("/root/Node2D/Boundaries/TopBound/")
	bottom_bound = get_node("/root/Node2D/Boundaries/Death/")
	col = get_node("/root/Node2D/Paddle/Sprite2D/CharacterBody2D/CollisionShape2D")
	sprite = get_node("/root/Node2D/Paddle/Sprite2D/")

	align_left()
	align_right()
	align_top()
	align_bottom()

func align_left():
	left_bound.position = Vector2(0-(screen_size.x/2),0)
	print(screen_size)
	print(left_bound.position)

func align_right():
	right_bound.position = Vector2(screen_size.x/2, 0)
	print(right_bound.position)

func align_top():
	top_bound.position = Vector2(0, 0 - (screen_size.y/2))
	print(top_bound.position)

func align_bottom():
	var shape = col.shape
	var sprite_height = shape.extents.y
	print(sprite_height)
	var sprite_y_position = sprite.position.y
	bottom_bound.position = Vector2(0, sprite_y_position+sprite_height/2-700)
	print(bottom_bound.position)
