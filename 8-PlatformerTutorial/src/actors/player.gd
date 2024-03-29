extends Actor

@export var stomp_impulse: = 1000.0

func _on_EnemyArea_area_entered(area: Area2D):
	_velocity = get_stomp_velocity(_velocity, stomp_impulse)

func _on_EnemyArea_body_entered(body: PhysicsBody2D):
	die()

func _physics_process(delta: float):
	var is_jump_interrupted: bool = Input.is_action_just_released("jump") and _velocity.y < 0.0
	var direction: = get_direction()
	_velocity = get_move_velocity(_velocity, direction, speed, is_jump_interrupted)
	set_velocity(_velocity)
	set_up_direction(FLOOR_NORMAL)
	set_floor_snap_length(50.0)
	set_floor_max_angle(PI / 3.0)
	move_and_slide()
	_velocity = velocity

func get_direction() -> Vector2:
	return Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		-1.0 if Input.is_action_just_pressed("jump") and is_on_floor() else 0.0
	)

func get_move_velocity(
		linear_velocity: Vector2,
		direction: Vector2,
		speed: Vector2,
		is_jump_interrupted: bool
	) -> Vector2:
	var out: = linear_velocity
	out.x = speed.x * direction.x
	out.y += gravity * get_physics_process_delta_time()
	
	if direction.y == -1.0:
		out.y = speed.y * direction.y
	if is_jump_interrupted:
		out.y = 0.0
	
	return out

func get_stomp_velocity(linear_velocity: Vector2, impluse: float) -> Vector2:
	var out: = linear_velocity
	out.y = -impluse
	return out

func die():
	PlayerData.deaths += 1
	queue_free()
