extends CharacterBody2D

# All these can be edited via inspector
@export var acceleration = 500 #LightPlayer x-speed
@export var deceleration = 50 #LightPlayer x-deceleration speed
@export var animDamper = 1.0 #IGNORE, dead variable
@export var gravity = 100 #LightPlayer Gravity
@export var jump_force = 200 #LightPlayer Jumpforce
@export var activeCharacter = true #Only change from inspector in level if wnat to start as ghost?
@export var animated_sprite_2d: AnimatedSprite2D

var currentInteractable: Area2D = null #Used for interacting / lightSwitch trigger detection


# JUmp light character
func _jump():
	if is_on_floor():
		velocity.y = (-jump_force * jump_force) / gravity

# Swap if activeCharacter or not
func _swap():
	activeCharacter = !activeCharacter
		
# Interact function for interacting with lights
func _process(_delta):
	if Input.is_action_just_pressed("interact_object") and currentInteractable and activeCharacter:
		currentInteractable.interact()

# Physics
func _physics_process(delta):
	# Apply gravity
	if !is_on_floor():
		velocity.y += gravity * delta

	# X-axis movement
	if activeCharacter:
		var direction = Input.get_axis("left", "right")
		if direction:
			velocity.x = direction * acceleration
			
			if direction <0:
				animated_sprite_2d.flip_h =true
				animated_sprite_2d.speed_scale = direction *animDamper
				animated_sprite_2d.play("walk")
			elif direction > 0:
				animated_sprite_2d.flip_h =false
				animated_sprite_2d.speed_scale = direction *animDamper
				animated_sprite_2d.play("walk")
			
			 
		else:
			velocity.x = move_toward(velocity.x, 0, deceleration)
			animated_sprite_2d.play("idle")
	else:
		if velocity.x != 0:
			velocity.x = move_toward(velocity.x, 0, deceleration)
	
	# Move character
	move_and_slide()
