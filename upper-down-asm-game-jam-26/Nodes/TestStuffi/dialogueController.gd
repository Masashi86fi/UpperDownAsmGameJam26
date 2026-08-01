extends CanvasLayer

@onready var label = $Control/PanelLabel/MarginContainer/DialogueLabel
@onready var panel = $Control/PanelLabel
@onready var audio = $Control/AudioStreamPlayer2D
@onready var itemlabel = $Control/ItemPanel/MarginContainer/ItemLabel
@onready var itemicon = $Control/ItemPanel/MarginContainer/ItemSprite
@onready var itemPanel = $Control/ItemPanel
@onready var interactPanel = $Control/InteractPanel
var typing
var dialog_id = 0

func show_dialogue(messages: Array):
	dialog_id += 1
	var current_id = dialog_id
	typing = true
	panel.show()
	
	for message in messages:
		if current_id != dialog_id:
			return
		
		#if typing:
		label.text = message["text"]
		label.visible_characters = 0
		await write_message(message["text"], message["speed"], message["delay"], current_id)
		#else:
		#	break
		
	if current_id == dialog_id:
		panel.visible = false
		typing = false
	
func write_message(text: String, textSpeed: float, delay: float,  current_id: int):
	for i in text.length():
		if current_id != dialog_id:
			return
			
		label.visible_characters += 1
		if text[i] != " ":
			audio.play()
			
		await get_tree().create_timer(textSpeed).timeout
		
	if current_id != dialog_id:
		return
		
	label.visible_characters = -1
	await get_tree().create_timer(delay).timeout
	
func _addItem(item: String, icon: Texture):
	itemlabel.text = item
	itemicon.texture = icon
	itemPanel.visible = true
	
func _hideItem():
	itemPanel.visible = false

func hide_message():
	dialog_id += 1
	panel.visible = false
	audio.playing = false
	
func toggleInteractUI(state: bool):
	interactPanel.visible = state
