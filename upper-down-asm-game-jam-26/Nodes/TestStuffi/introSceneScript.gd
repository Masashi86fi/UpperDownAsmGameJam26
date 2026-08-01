extends Node

@export var sceneRoute: PackedScene
@export var dialogue = [
	{
		"text": "Imma be honest you...",
		"speed": 0.03,
		"delay": 2.00
	},
	{
		"text": "Imma be pretty bad at this game.",
		"speed": 0.02,
		"delay": 4.00
	}
]

# Called when the node enters the scene tree for the first time.
func _ready():
	await get_tree().create_timer(2.0).timeout
	await Dialogue.show_dialogue(dialogue)
	get_tree().change_scene_to_packed(sceneRoute)
