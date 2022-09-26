extends Spatial

signal goal_scored

func _on_GoalArea_body_entered(body):
	if body.is_in_group("puck"):
		emit_signal("goal_scored")
