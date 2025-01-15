extends CharacterBody2D

var base_speed = 1500
var speed = base_speed
var rotation_speed = 999
var counter = 0
var bouncetop = true

@onready var player_sprite = get_node("/root/Node2D/Ball/CharacterBody2D/Sprite2D")

func _ready():
	adjust_speed_for_screen_size()
	
	if PlayerSelection.selected_sprite != null:
		player_sprite.texture = PlayerSelection.selected_sprite
	
	randomize()
	var slope = round(randf_range(0.7, 1.5) * 10) / 10.0
	print(slope)
	velocity = Vector2(slope * 100, 100).normalized() * speed

func adjust_speed_for_screen_size():
	var screen_height = DisplayServer.window_get_size().y
	speed = base_speed * screen_height / 1280.0
	print("Adjusted speed:", speed)

func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	rotation_degrees += rotation_speed * delta

	if collision:
		velocity = velocity.bounce(collision.get_normal())
		velocity = velocity.normalized() * speed
		var collider = collision.get_collider()
		if collider.is_in_group("player"):
			if bouncetop:
				speed += 50
				rotation_speed += 10
				velocity = velocity.normalized() * speed
				counter += 1
				print(counter)
				var label = get_node("/root/Node2D/Control/Points/Label")
				label.text = str(counter)
				bouncetop = false
		elif collider.is_in_group("death"):
			speed = 0
			velocity = velocity.normalized() * speed
			print("You Died")
			var label = get_node("/root/Node2D/Control/death message/Label")
			label.text = "YOU DIED"
			var restart_button = get_node("/root/Node2D/Control/death message/Retry")
			restart_button.visible = true
			var end_button = get_node("/root/Node2D/Control/death message/End")
			end_button.visible = true
			get_tree().paused = true
		elif collider.is_in_group("top"):
			bouncetop = true

	if velocity.x > 0:
		rotation_speed = abs(rotation_speed)
	elif velocity.x < 0:
		rotation_speed = -abs(rotation_speed)

func _on_retry_pressed() -> void:
	print("Retry")
	get_tree().paused = false
	get_tree().reload_current_scene()

func _on_end_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://TitleScreen.tscn")
