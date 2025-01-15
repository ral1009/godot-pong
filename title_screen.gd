extends Control

func _ready():
	$Button.connect("pressed", Callable(self, "_on_start_pressed"))

func _on_start_pressed():
	get_tree().change_scene_to_file("res://node_2d.tscn")

func _on_quit_pressed() -> void:
	get_tree().quit()
