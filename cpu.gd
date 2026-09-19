extends Sprite2D

@onready var ball = get_node("/root/Node2D/Ball/CharacterBody2D")
@onready var camera = get_node("/root/Node2D/Camera2D/")
@onready var wall = get_node("/root/Node2D/Boundaries/TopBound/")
var screen_size = Vector2.ZERO
var base_speed = 500
var movement_speed = 10
var paddle_ratio = (720 - 1100) / 720

func _ready():
	if PlayerSelection.difficulty == "easy":
		base_speed = PlayerSelection.ballspeed/3
	elif PlayerSelection.difficulty == "medium":
		base_speed = PlayerSelection.ballspeed/2
	elif PlayerSelection.difficulty == "hard":
		base_speed = PlayerSelection.ballspeed
	screen_size = get_viewport().size
	position.x = screen_size.x / 2
	movement_speed = base_speed * (screen_size.x / 720)
	set_process_input(true)
	var paddle_ratio = (720 - 1100) / 720
	position.x = screen_size.x / 2

func _process(delta):
	var ball_center_x = ball.position.x
	var paddle_center_x = position.x
	screen_size = get_viewport().size
	var camera_visible_height = screen_size.y / camera.zoom.y
	var paddle_ratio = (720 - 1100) / 720

	if ball_center_x > paddle_center_x:
		position.x += movement_speed * delta
	elif ball_center_x < paddle_center_x:
		position.x -= movement_speed * delta

	var camera_visible_width = screen_size.x / camera.zoom.x
	var sprite_width = texture.get_width() * scale.x
	var half_width = sprite_width / 2
	var left_bound = camera.position.x - camera_visible_width / 2 + half_width
	var right_bound = camera.position.x + camera_visible_width / 2 - half_width

	position.x = clamp(position.x, left_bound, right_bound)
	position.y = clamp(position.y, wall.position.y + 700, wall.position.y + 700)
	print(position.y)

	add_imperfections(delta)

func add_imperfections(delta):
	if randf() < 0.01:
		position.x += randf_range(-movement_speed * 0.5, movement_speed * 0.5) * delta
