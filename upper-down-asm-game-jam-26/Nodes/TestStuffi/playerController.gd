extends Node2D

@export var lightCharacter: CharacterBody2D
@export var darkCharacter: CharacterBody2D
@onready var playerCamera: Camera2D = $Camera2D
var activeCharacter: CharacterBody2D

func _ready():
	activeCharacter = lightCharacter
	

func _input(event):
	if event.is_action_pressed("Swap"):
		if activeCharacter == lightCharacter:
			activeCharacter = darkCharacter
		else:
			activeCharacter = lightCharacter
		print("Swapped to ",  activeCharacter)
		lightCharacter._swap()
		darkCharacter._swap()
	if(Input.is_action_just_pressed("Jump") and activeCharacter.is_on_floor()):
		print("JUMP!")
		activeCharacter._jump()
		
func _process(delta):
	playerCamera.global_position = activeCharacter.global_position
	
