extends CharacterBody2D

# All these can be edited via inspector
@export var acceleration = 500 #LightPlayer x-speed
@export var deceleration = 50 #LightPlayer x-deceleration speed
@export var maxSpeed = 200 #IGNORE, dead variable
@export var gravity = 100 #LightPlayer Gravity
@export var jump_force = 200 #LightPlayer Jumpforce
@export var activeCharacter = false #Only change from inspector in level if wnat to start as ghost?
@onready var itemSprite = $DarkSprite/CurrentItem #Current carried item sprite reference
var currentItem: String #Current item carried (we use names in code, simple)

# JUmp dark character
func _jump():
	if is_on_floor():
		velocity.y = -jump_force * -1

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
		velocity.y += gravity * delta * -1
		
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
