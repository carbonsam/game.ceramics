extends Control

@onready var viewport: Viewport = get_viewport()
@onready var scene_tree: SceneTree = get_tree()
@onready var pause_overlay: ColorRect = $PauseOverlay
@onready var score_label: Label = $ScoreContainer/ScoreLabel
@onready var pause_label: Label = $PauseOverlay/Title

const DIED_MESSAGE = "You died"

var paused: = false : set = set_paused

func _ready():
	PlayerData.score_updated.connect(update_interface)
	PlayerData.player_died.connect(_on_PlayerData_player_died)
	update_interface()

func _on_PlayerData_player_died():
	self.paused = true
	pause_label.text = DIED_MESSAGE

func _unhandled_input(event):
	if event.is_action_pressed("pause") and pause_label.text != DIED_MESSAGE:
		self.paused = !paused
		viewport.set_input_as_handled()

func update_interface():
	score_label.text = str(PlayerData.score).lpad(3, "0")

func set_paused(value: bool) -> void:
	paused = value
	scene_tree.paused = value
	pause_overlay.visible = value
