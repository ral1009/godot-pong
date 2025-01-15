extends Sprite2D

var is_dragging = false
var drag_offset = Vector2.ZERO
var screen_size = Vector2.ZERO
@onready var camera = get_node("/root/Node2D/Camera2D/")
var base_speed = 10
var movement_speed = 10


func _ready():
	set_process_input(true)
	screen_size = get_viewport().size
	var paddle_ratio = (720 - 1100) / 720
	position.x = screen_size.x / 2
	update_paddle_y_position(paddle_ratio)

	movement_speed = base_speed * (screen_size.x / 720)

func _input(event):
	if event is InputEventMouseButton:
		if event.pressed:
			var mouse_pos = get_global_mouse_position()
			is_dragging = true
			drag_offset = mouse_pos - global_position
		else:
			is_dragging = false
	elif event is InputEventMouseMotion and is_dragging:
		var new_pos = get_global_mouse_position() - drag_offset
		new_pos.y = global_position.y
		global_position = new_pos

func right() -> void:
	position.x += movement_speed

func left() -> void:
	position.x -= movement_speed

func up() -> void:
	position.y -= movement_speed

func down() -> void:
	position.y += movement_speed

func update_paddle_y_position(paddle_ratio: float):
	var camera_visible_height = screen_size.y / camera.zoom.y
	position.y = camera.position.y + camera_visible_height / 2 - camera_visible_height * paddle_ratio

func _process(delta):
	screen_size = get_viewport().size
	var camera_visible_height = screen_size.y / camera.zoom.y
	var paddle_ratio = (720 - 1100) / 720
	position.y = camera.position.y + camera_visible_height / 2 - camera_visible_height * paddle_ratio

	var camera_zoom = camera.zoom.x
	var camera_visible_width = screen_size.x / camera_zoom
	var sprite_width = texture.get_width() * scale.x

	if Input.is_action_pressed("right"):
		right()
	if Input.is_action_pressed("left"):
		left()

	var half_width = sprite_width / 2
	var left_bound = camera.position.x - camera_visible_width / 2 + half_width
	var right_bound = camera.position.x + camera_visible_width / 2 - half_width

	position.x = clamp(position.x, left_bound, right_bound)
	position.y = clamp(position.y, camera.position.y - camera_visible_height / 2 + half_width, 
	camera.position.y + camera_visible_height / 2 - half_width)
