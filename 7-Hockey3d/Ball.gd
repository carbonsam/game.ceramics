extends RigidBody

export var min_speed = 5.0
export var max_speed = 30.0
export var rate_of_speed_increase = 1.0

var current_speed = min_speed
var velocity = Vector3.ZERO
var started = false

func _ready():
	randomize()
	
	# Pick a random starting direction
	velocity = Vector3(randf(), 0, randf())

func _physics_process(delta):
	# Speed up on collisions
#	for i in range(get_slide_count()):
#		var collision = get_slide_collision(i)
#		if collision.collider.is_in_group("paddle"):
#			current_speed += rate_of_speed_increase

	var current_velocity = linear_velocity.normalized()
	linear_velocity = Vector3(current_velocity.x * current_speed * delta, 0, current_velocity.z * current_speed * delta)
	
	if not started:
		linear_velocity = velocity * current_speed
