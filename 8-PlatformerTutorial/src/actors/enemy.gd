extends Actor

func _ready():
	set_process_mode(false)
	_velocity.x = -speed.x

func _on_StompArea_body_entered(body: PhysicsBody2D):
	if body.global_position.y > get_node("StompArea").global_position.y:
		return
	get_node("CollisionShape2D").disabled = true
	queue_free()

func _physics_process(delta: float):
	_velocity.y += gravity * delta
	if is_on_wall():
		_velocity.x *= -1.0
	set_velocity(_velocity)
	set_up_direction(FLOOR_NORMAL)
	set_floor_snap_length(50.0)
	set_floor_max_angle(PI / 3.0)
	move_and_slide()
	_velocity.y = velocity.y
