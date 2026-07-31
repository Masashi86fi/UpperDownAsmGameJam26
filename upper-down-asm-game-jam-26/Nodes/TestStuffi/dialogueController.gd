extends CanvasLayer

@onready var label = $Control/PanelLabel/MarginContainer/DialogueLabel
@onready var panel = $Control/PanelLabel
@onready var audio = $Control/AudioStreamPlayer2D
var typing

#func show_message(message: String):
#	label.text = message
#	visible = true

func show_dialogue(messages: Array):
	typing = true
	for message in messages:
		if typing:
			label.text = message["text"]
			label.visible_characters = 0
			panel.show()
			await write_message(message["text"], message["speed"], message["delay"])
	panel.visible = false
	typing = false
	
func write_message(text: String, textSpeed: float, delay: float):
	for i in text.length():
		if !typing:
			break
		label.visible_characters += 1
		if text[i] != " ":
			audio.play()
		await get_tree().create_timer(textSpeed).timeout
	label.visible_characters = -1
	await get_tree().create_timer(delay).timeout

func hide_message():
	typing = false
	panel.visible = false
	audio.playing = false
