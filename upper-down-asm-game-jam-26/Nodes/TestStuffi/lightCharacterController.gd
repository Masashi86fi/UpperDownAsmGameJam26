extends CharacterBody2D

@export var acceleration = 500
@export var deceleration = 50
@export var maxSpeed = 200
@export var gravity = 100
@export var jump_force = 200
@export var activeCharacter = true
var currentInteractable: Area2D = null

	
func _jump():
	if is_on_floor():
		velocity.y = (-jump_force * jump_force) / gravity

func _swap():
	activeCharacter = !activeCharacter
		
	
func _process(_delta):
	if Input.is_action_just_pressed("interact_object") and currentInteractable and activeCharacter:
		currentInteractable.interact()

func _physics_process(delta):
	# Apply gravity
	if !is_on_floor():
		velocity.y += gravity * delta

	if activeCharacter:
		var direction = Input.get_axis("left", "right")
		if direction:
			velocity.x = direction * acceleration
		else:
			velocity.x = move_toward(velocity.x, 0, deceleration)
	else:
		if velocity.x != 0:
			velocity.x = move_toward(velocity.x, 0, deceleration)

	move_and_slide()
