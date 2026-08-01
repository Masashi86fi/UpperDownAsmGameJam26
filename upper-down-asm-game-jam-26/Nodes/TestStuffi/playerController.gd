extends Node2D
# Honestly..... don't touch this stuff?
@export var lightCharacter: CharacterBody2D
@export var darkCharacter: CharacterBody2D
@export var cameraOffset: Vector2
@onready var playerCamera: Camera2D = $Camera2D
var ghostUnlocked = false
var activeCharacter: CharacterBody2D

func _ready():
	activeCharacter = lightCharacter
	
func _unlockGhost():
	ghostUnlocked = true

func _input(event):
	if event.is_action_pressed("swap"):
		if ghostUnlocked:
			if activeCharacter == lightCharacter:
				activeCharacter = darkCharacter
			else:
				activeCharacter = lightCharacter
			print("Swapped to ",  activeCharacter)
			lightCharacter._swap()
			darkCharacter._swap()
	if(Input.is_action_just_pressed("jump") and activeCharacter.is_on_floor()):
		print("JUMP!")
		activeCharacter._jump()
	if(Input.is_action_just_pressed("skipDialogue")):
		Dialogue.hide_message()
		
func _process(_delta):
	if(activeCharacter == lightCharacter):
		playerCamera.global_position = activeCharacter.global_position - cameraOffset
	else:
		playerCamera.global_position = activeCharacter.global_position + cameraOffset
