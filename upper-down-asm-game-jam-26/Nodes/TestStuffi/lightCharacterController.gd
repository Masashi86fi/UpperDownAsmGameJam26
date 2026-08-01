extends CharacterBody2D

# All these can be edited via inspector
@export var acceleration = 500 #LightPlayer x-speed
@export var deceleration = 50 #LightPlayer x-deceleration speed
#@export var maxFallSpeed = 1200 #FallSpeed for gravity
@export var jumpHeightPixels: float = 20.0 #LightPlayer jump height
@export var jumpPeakTime: float = 0.5 #LightPlayer time to reach jump height peak
@export var jumpFallTime: float = 0.5 #LighPlayer time to fall back to starting y.height
var gravity: float #Gravity for when jumping
var fallGravity: float #Gravity after reaching jumpHeight
var jumpForce: float #Calculated jumpforce
@export var activeCharacter = true #Only change from inspector in level if wnat to start as ghost?
var currentInteractable: Area2D = null #Used for interacting / lightSwitch trigger detection

# Calculate gravities+jumpForce to reach jump peak and fall times mathematically
func _ready():
	gravity = (2.0 * jumpHeightPixels) / pow(jumpPeakTime, 2)
	fallGravity = (2 * jumpHeightPixels) / pow(jumpFallTime, 2)
	jumpForce = gravity * jumpPeakTime

# JUmp light character
func _jump():
	if is_on_floor():
		velocity.y = -jumpForce

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
		if velocity.y < 0:
			velocity.y += gravity * delta
		else:
			velocity.y += fallGravity * delta
	
	# X-axis movement
	if activeCharacter:
		var direction = Input.get_axis("left", "right")
		if direction:
			velocity.x = direction * acceleration
		else:
			velocity.x = move_toward(velocity.x, 0, deceleration)
	else:
		if velocity.x != 0:
			velocity.x = move_toward(velocity.x, 0, deceleration)
	
	# Move character
	move_and_slide()
