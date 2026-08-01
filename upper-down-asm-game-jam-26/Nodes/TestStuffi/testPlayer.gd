extends CharacterBody2D
# LEFTOVER Script; when both characters used same script
@export var acceleration = 1000
@export var deceleration = 1500
@export var turnAcceleration = 2500
@export var maxSpeed = 200
@export var gravity = 100
@export var jump_force = 200
@export var activeCharacter = true
@export var gravityDirection = 1
	
func _jump():
	if is_on_floor():
		velocity.y = -jump_force * gravityDirection

func _swap():
	activeCharacter = !activeCharacter

func _physics_process(delta):
	up_direction = Vector2.UP * gravityDirection
	
	# Apply gravity
	if !is_on_floor():
		velocity.y += gravity * delta * gravityDirection

	if activeCharacter:
		var direction = Input.get_axis("left", "right")
		if direction != 0:
			var targetSpeed = direction * maxSpeed
			if sign(velocity.x) != sign(targetSpeed) and velocity.x != 0:
				velocity.x = move_toward(
				velocity.x,
				targetSpeed,
				turnAcceleration * delta
			)
			else:
				velocity.x = move_toward(
				velocity.x,
				targetSpeed,
				acceleration * delta
			)
	else:
		# Stop inactive character
		velocity.x = move_toward(
			velocity.x,
			0,
				deceleration * delta
		)
	
	#if activeCharacter:
	#	var direction = Input.get_axis("Left", "Right")
	#	velocity.x = direction * acceleration

	move_and_slide()
