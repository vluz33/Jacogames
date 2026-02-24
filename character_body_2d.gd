extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -600.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	
	Global.walk = false
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction < 0:
		Global.direita = true
	elif direction > 0:
		Global.direita = false
	if direction:
		velocity.x = direction * SPEED
		Global.walk = true
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		Global.walk = false 
		
	if velocity.y < 0:
		Global.jump = true
		Global.fall = false
	elif velocity.y > 0:
		Global.jump = false
		Global.fall = true
	else:
		Global.jump = false
		Global.fall = false

	move_and_slide()
