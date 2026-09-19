extends Node2D

var left_body : CharacterBody2D
var right_body : CharacterBody2D
var top_body : CharacterBody2D
var bottom_body : CharacterBody2D

var left_collision_shape : CollisionShape2D
var right_collision_shape : CollisionShape2D
var top_collision_shape : CollisionShape2D
var bottom_collision_shape : CollisionShape2D

var screen_size : Vector2
var screen_center : Vector2

func _ready():
	# Get the screen size
	screen_size = get_viewport().size
	screen_center = screen_size / 2  # The center of the screen

	# Get the CharacterBody2D nodes for each side
	left_body = get_node("/root/Node2D/Boundaries/LeftBound/")
	right_body = get_node("/root/Node2D/Boundaries/RightBound/")
	top_body = get_node("/root/Node2D/Boundaries/TopBound/")
	bottom_body = get_node("/root/Node2D/Boundaries/Death/")

	# Get the CollisionShape2D nodes for each body
	left_collision_shape = left_body.get_node("CollisionShape2D")
	right_collision_shape = right_body.get_node("CollisionShape2D")
	top_collision_shape = top_body.get_node("CollisionShape2D")
	bottom_collision_shape = bottom_body.get_node("CollisionShape2D")

	# Align the bodies to the respective edges
	align_left()
	align_right()
	align_top()
	align_bottom()

# Function to align left side (left body to left edge)
func align_left():
	var shape = left_collision_shape.shape
	if shape is RectangleShape2D:
		var rect_size = shape.extents * 2  # Full width of the shape
		# Align the left edge of the body to the screen's left edge, with center at (0, 0)
		left_body.position = Vector2(-screen_center.x + rect_size.x / 2, left_body.position.y)
		print("Left Body Position: ", left_body.position)

# Function to align right side (left edge of the right body to right edge of screen)
func align_right():
	var shape = right_collision_shape.shape
	if shape is RectangleShape2D:
		var rect_size = shape.extents * 2  # Full width of the shape
		# Align the right edge of the body to the screen's right edge, with center at (0, 0)
		right_body.position = Vector2(screen_center.x - rect_size.x / 2, right_body.position.y)
		print("Right Body Position: ", right_body.position)

# Function to align top side (top body to top edge)
func align_top():
	var shape = top_collision_shape.shape
	if shape is RectangleShape2D:
		var rect_size = shape.extents * 2  # Full height of the shape
		# Align the top edge of the body to the screen's top edge, with center at (0, 0)
		top_body.position = Vector2(top_body.position.x, screen_center.y - rect_size.y / 2)
		print("Top Body Position: ", top_body.position)

# Function to align bottom side (bottom body to bottom edge)
func align_bottom():
	var shape = bottom_collision_shape.shape
	if shape is RectangleShape2D:
		var rect_size = shape.extents * 2  # Full height of the shape
		# Align the bottom edge of the body to the screen's bottom edge, with center at (0, 0)
		bottom_body.position = Vector2(bottom_body.position.x, -screen_center.y + rect_size.y / 2)
		print("Bottom Body Position: ", bottom_body.position)
