extends KinematicBody

export var speed = 20.0

var velocity = Vector3.ZERO

func _physics_process(delta):
	var direction = Vector3.ZERO
	
	if Input.is_action_pressed("left"):
		direction.x -= 1.0
	if Input.is_action_pressed("right"):
		direction.x += 1.0
	
	if direction != Vector3.ZERO:
		direction = direction.normalized()
	
	velocity.x = direction.x * speed
	
	velocity = move_and_slide(velocity, Vector3.UP)
