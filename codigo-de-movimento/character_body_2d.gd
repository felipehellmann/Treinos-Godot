extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -450.0
var jumps = 2


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		jumps -= 1

	# double jump \ pulo duplo moleque hehehe
	if Input.is_action_just_pressed("ui_accept") and not is_on_floor() and jumps < 2:
		velocity.y = JUMP_VELOCITY
		jumps = 2



	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
