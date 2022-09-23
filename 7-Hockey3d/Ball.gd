extends KinematicBody

export var min_speed = 10.0
export var max_speed = 75.0
export var rate_of_speed_increase = 2.5

var current_speed = min_speed
var velocity = Vector3.ZERO
var remainder = 0.0

func _ready():
	randomize()
	# TODO: Randomly change which side the ball moves towards
	velocity = Vector3(current_speed, 0, current_speed)

func _physics_process(delta):
	var collision = move_and_collide(velocity * delta + velocity.normalized() * remainder)
	remainder = 0.0
	
	if collision:
		var speed = velocity.length()
		var direction = velocity.normalized()
		var normal = collision.normal
		
		if collision.collider.is_in_group("paddle") and speed < max_speed:
			speed += rate_of_speed_increase
		
		remainder = collision.remainder.length()
		velocity = direction.bounce(normal) * speed
