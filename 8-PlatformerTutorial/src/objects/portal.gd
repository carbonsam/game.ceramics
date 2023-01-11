@tool
extends Area2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer

@export var next_scene: PackedScene

func _on_body_entered(body):
	teleport()

func _get_configuration_warning():
	return "The next scene property can't be empty" if not next_scene else ""

func teleport() -> void:
	await animation_player.play("fade_in")
	get_tree().change_scene_to_packed(next_scene)
