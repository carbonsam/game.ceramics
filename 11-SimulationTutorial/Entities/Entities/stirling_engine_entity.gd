extends Entity

const BOOTUP_TIME = 6.0
const SHUTDOWN_TIME = 3.0

@onready var animation_player = $AnimationPlayer
@onready var tween = get_tree().create_tween()
@onready var shaft = $PistonShaft

func _ready():
	animation_player.play("work")
	tween.tween_property(animation_player, "playback_speed", 1, BOOTUP_TIME).from(0)
	tween.tween_property(shaft, "modulate", Color(0.5, 1, 0.5), BOOTUP_TIME).from(Color.WHITE)
	tween.play()
