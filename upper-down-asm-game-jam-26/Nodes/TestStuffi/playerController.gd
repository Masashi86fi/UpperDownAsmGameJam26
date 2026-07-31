extends Node2D

@export var lightCharacter: CharacterBody2D
@export var darkCharacter: CharacterBody2D
@onready var playerCamera: Camera2D = $Camera2D
var activeCharacter: CharacterBody2D

@export var dialogue = [
	{
		"text": "Moi beli dialogue teknologia.",
		"speed": 0.05,
		"delay": 2.00
	},
	{
		"text": "Dis text speed is stupid fast",
		"speed": 0.02,
		"delay": 4.00
	},
	{
		"text": "K OOL BYEZ (rip C)",
		"speed": 0.1,
		"delay": 1.00
	}
]

func _ready():
	activeCharacter = lightCharacter
	

func _input(event):
	if event.is_action_pressed("swap"):
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
	if(Input.is_action_just_pressed("testText")):
		Dialogue.show_dialogue(dialogue)
	if(Input.is_action_just_pressed("skipDialogue")):
		Dialogue.hide_message()
		
func _process(_delta):
	playerCamera.global_position = activeCharacter.global_position
	
