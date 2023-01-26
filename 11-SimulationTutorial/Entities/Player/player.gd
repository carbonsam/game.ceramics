extends CharacterBody2D


const SPEED = 200.0

func _physics_process(_delta):
	var direction = Vector2(
		(Input.get_action_strength("right") - Input.get_action_strength("left")) * 2.0,
		Input.get_action_strength("down") - Input.get_action_strength("up")
	).normalized()
	
	velocity = direction * SPEED

	move_and_slide()
