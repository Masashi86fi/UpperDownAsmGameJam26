extends CharacterBody2D

# All these can be edited via inspector
@export var acceleration = 500 #DarkPlayer x-speed
@export var deceleration = 50 #DarkPlayer x-deceleration speed
@export var jumpHeightPixels: float = 20.0 #LightPlayer jump height
@export var jumpPeakTime: float = 0.5 #DarkPlayer time to reach jump height peak
@export var jumpFallTime: float = 0.5 #DarkPlayer time to fall back to starting y.height
var gravity: float #Gravity for when jumping
var fallGravity: float #Gravity after reaching jumpHeight
var jumpForce: float #Calculated jumpforce
@export var activeCharacter = false #Only change from inspector in level if wnat to start as ghost?
@onready var itemSprite = $DarkSprite/CurrentItem #Current carried item sprite reference
var currentItem: String #Current item carried (we use names in code, simple)

# Calculate gravities+jumpForce to reach jump peak and fall times mathematically
func _ready():
	gravity = (2.0 * jumpHeightPixels) / pow(jumpPeakTime, 2)
	fallGravity = (2 * jumpHeightPixels) / pow(jumpFallTime, 2)
	jumpForce = gravity * jumpPeakTime

# JUmp dark character
func _jump():
	if is_on_floor():
		velocity.y = jumpForce

# Swap if activeCharacter or not
func _swap():
	activeCharacter = !activeCharacter

# Set player picked up item in hand + store itemName
func _pickupItem(sprite: Texture, item: String):
	itemSprite.texture = sprite
	currentItem = item

# Remove the picked up item sprite texture + remove itemName
func _removeItem():
	itemSprite.texture = null
	currentItem = ""

# Physics
func _physics_process(delta):
	up_direction = Vector2.UP * -1
	
	# Apply gravity
	if !is_on_floor():
		print(velocity.y)
		if velocity.y > 0:
			velocity.y -= gravity * delta
		else:
			velocity.y -= fallGravity * delta
			
	#if !is_on_floor():
	#	velocity.y += gravity * delta * -1
		
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
	
	#if activeCharacter:
	#	var direction = Input.get_axis("Left", "Right")
	#	velocity.x = direction * acceleration

	# Move character
	move_and_slide()
