class_name MainMenu
extends Control

@onready var start_button: Button = $MarginContainer/HBoxContainer/VBoxContainer/StartButton as Button
@onready var exit_button: Button = $MarginContainer/HBoxContainer/VBoxContainer/ExitButton as Button
const MAIN_MENU_THEME = preload("res://Resources/Audio/Music/main_theme.ogg")
const EXIT_HOVER = preload("res://Resources/Audio/SFX/menu/on_exit_hover.ogg")
const HOVER = preload("res://Resources/Audio/SFX/menu/on_hover.ogg")
const CLICK = preload("res://Resources/Audio/SFX/menu/on_click.ogg")

@onready var start_level=preload("res://Nodes/Main/main.tscn") as PackedScene

func _ready():
	start_button.button_down.connect(on_start_pressed)
	start_button.mouse_entered.connect(on_hover)
	start_button.mouse_exited.connect(on_exit_hover)
	start_button.button_down.connect(on_click)
	
	exit_button.button_down.connect(on_exit_pressed)
	exit_button.mouse_entered.connect(on_hover)
	exit_button.mouse_exited.connect(on_exit_hover)
	exit_button.button_down.connect(on_click)
	AudioManager.play_music(MAIN_MENU_THEME)
	
func on_start_pressed() -> void:
	get_tree().change_scene_to_packed(start_level)
	
func on_exit_pressed() -> void:
	get_tree().quit()
	
func on_hover():
	AudioManager.play_menu_FX(HOVER)

func on_exit_hover():
	AudioManager.play_menu_FX(EXIT_HOVER)

func on_click():
	AudioManager.play_menu_FX(CLICK)
