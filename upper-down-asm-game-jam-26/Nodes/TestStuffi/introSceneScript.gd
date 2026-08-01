extends Node

@export var sceneRoute: PackedScene #Next scene/level to load
@export var dialogue = [ #Check dialogueTrigger for notes
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

# Runs at start of intro scene/level; basically the content of the intro, add whatever needed
func _ready():
	await get_tree().create_timer(2.0).timeout
	await Dialogue.show_dialogue(dialogue)
	get_tree().change_scene_to_packed(sceneRoute)
