extends CharacterBody2D

@export var acceleration = 500
@export var deceleration = 50
@export var maxSpeed = 200
@export var gravity = 100
@export var jump_force = 200
@export var activeCharacter = false
@onready var itemSprite = $DarkSprite/CurrentItem
var currentItem: String
	
func _jump():
	if is_on_floor():
		velocity.y = -jump_force * -1

func _swap():
	activeCharacter = !activeCharacter
	
func _pickupItem(sprite: Texture, item: String):
	itemSprite.texture = sprite
	currentItem = item
	
func _removeItem():
	itemSprite.texture = null
	currentItem = ""

func _physics_process(delta):
	up_direction = Vector2.UP * -1
	
	# Apply gravity
	if !is_on_floor():
		velocity.y += gravity * delta * -1

	if activeCharacter:
		var direction = Input.get_axis("left", "right")
		if direction:
			velocity.x = direction * acceleration
		else:
			velocity.x = move_toward(velocity.x, 0, deceleration)
	
	#if activeCharacter:
	#	var direction = Input.get_axis("Left", "Right")
	#	velocity.x = direction * acceleration

	move_and_slide()
