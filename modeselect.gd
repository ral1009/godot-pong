extends Control

@onready var one = get_node("/root/CanvasLayer/Control/oneplayer")
@onready var cpu = get_node("/root/CanvasLayer/Control/cpu")
@onready var two = get_node("/root/CanvasLayer/Control/twoplayer")
@onready var back = get_node("/root/CanvasLayer/Control/Button")
@onready var easy = get_node("/root/CanvasLayer/Control/easy")
@onready var medium = get_node("/root/CanvasLayer/Control/medium")
@onready var hard = get_node("/root/CanvasLayer/Control/hard")
@onready var label = get_node("/root/CanvasLayer/Control/Label")

func _on_oneplayer_pressed() -> void:
	get_tree().change_scene_to_file("res://node_2d.tscn")

func _on_twoplayer_pressed() -> void:
	get_tree().change_scene_to_file("res://2player.tscn")

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://TitleScreen.tscn")

func _on_cpu_pressed() -> void:
	one.visible = false
	cpu.visible = false
	two.visible = false
	back.visible = false
	easy.visible = true
	medium.visible = true
	hard.visible = true
	label.visible = true


func _on_easy_pressed() -> void:
	PlayerSelection.difficulty = "easy"
	get_tree().change_scene_to_file("res://cpuvsplayer.tscn")


func _on_medium_pressed() -> void:
	PlayerSelection.difficulty = "medium"
	get_tree().change_scene_to_file("res://cpuvsplayer.tscn")


func _on_hard_pressed() -> void:
	PlayerSelection.difficulty = "hard"
	get_tree().change_scene_to_file("res://cpuvsplayer.tscn")
