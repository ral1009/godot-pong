extends Sprite2D

@onready var color_rect = get_node("/root/Node2D/Control/RedDrag")
var is_dragging = false
var drag_offset = Vector2.ZERO
var screen_size = Vector2.ZERO
@onready var camera = get_node("/root/Node2D/Camera2D/")
@onready var wall = get_node("/root/Node2D/Boundaries/TopBound/")
var base_speed = 10
var movement_speed = 10


func _ready():
	set_process_input(true)
	screen_size = get_viewport().size
	var paddle_ratio = (720 - 1100) / 720
	position.x = screen_size.x / 2

	movement_speed = base_speed * (screen_size.x / 720)

func right() -> void:
	position.x += movement_speed

func left() -> void:
	position.x -= movement_speed

func up() -> void:
	position.y -= movement_speed

func down() -> void:
	position.y += movement_speed

func _process(delta):
	screen_size = get_viewport().size
	var camera_visible_height = screen_size.y / camera.zoom.y
	var paddle_ratio = (720 - 1100) / 720
	position.y = screen_size.y/12

	var camera_zoom = camera.zoom.x
	var camera_visible_width = screen_size.x / camera_zoom
	var sprite_width = texture.get_width() * scale.x
	
	if Input.is_action_pressed("d"):
		right()
	if Input.is_action_pressed("a"):
		left()


	var half_width = sprite_width / 2
	var left_bound = camera.position.x - camera_visible_width / 2 + half_width
	var right_bound = camera.position.x + camera_visible_width / 2 - half_width

	position.x = clamp(position.x, left_bound, right_bound)
	position.y = clamp(position.y, wall.position.y + 700, wall.position.y + 700)
