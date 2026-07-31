extends Area2D

@export var singleUse = true
var disabled = false
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

func _on_body_entered(_body):
	print("Player entered trigger!")
	if(disabled):
		return
	if(singleUse):
		set_deferred("monitoring", false)
	Dialogue.show_dialogue(dialogue)
