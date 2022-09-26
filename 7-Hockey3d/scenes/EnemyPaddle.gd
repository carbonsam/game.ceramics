extends KinematicBody

export var speed = 20.0

var target = null
var velocity = Vector3.ZERO

func init(puck_instance):
	target = puck_instance

func _physics_process(delta):
	var direction = Vector3.ZERO
	
	if target.transform.origin.x > transform.origin.x:
		direction.x += 1.0
	if target.transform.origin.x < transform.origin.x:
		direction.x -= 1.0
	
	if direction != Vector3.ZERO:
		direction = direction.normalized()
	
	velocity.x = direction.x * speed
	
	velocity = move_and_slide(velocity, Vector3.UP)
