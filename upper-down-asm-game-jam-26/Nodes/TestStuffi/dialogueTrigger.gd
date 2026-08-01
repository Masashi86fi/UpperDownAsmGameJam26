extends Area2D

@export var singleUse = true #Is the dialogueTrigger single
var disabled = false #IGNORE a leftover
# Dialogue content; edit from editor/inspector
@export var dialogue = [
	{
		"text": "Imma be honest you...", #Dialogue text
		"speed": 0.03, #Dialogue animatino speed
		"delay": 2.00 #Time before next dialogue
	},
	{
		"text": "Imma be pretty bad at this game.",
		"speed": 0.02,
		"delay": 4.00
	}
]

# When player (hopefully) enters the trigger
func _on_body_entered(_body):
	print("Player entered trigger!")
	if(disabled):
		return
	if(singleUse): # Disables dialogue trigger when triggered
		set_deferred("monitoring", false)
	Dialogue.show_dialogue(dialogue) # Play dialogue
