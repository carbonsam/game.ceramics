extends Area2D


@onready var animation_player: AnimationPlayer = get_node("AnimationPlayer")

@export var score: = 1

func _on_body_entered(body):
	PlayerData.score += score
	animation_player.play("fade_out")
