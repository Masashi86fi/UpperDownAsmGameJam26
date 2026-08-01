class_name LightSource
extends Area2D

@onready var collision = $CollisionShape2D #Reference to collision
@onready var sprite = $LightSprite #Reference to the light effect sprite
@export var enabledAtStart: bool = false #Is light active at start; set from inspector.
@export var respawnPoint: Node2D #Reference to ghost respawn point from the light

# Sets lightSprite + collision active/disabled based off of enabledAtStart value
func _ready():
	if enabledAtStart == false:
		collision.set_deferred("disabled", true)
		sprite.visible = true
	else:
		collision.set_deferred("disabled", false)
		sprite.visible = false

# DarkPlayer touches light; send them back to referenced/linked respawn point
func _on_body_entered(body: CharacterBody2D):
	if body.name == "DarkPlayer":
		body.global_position = respawnPoint.global_position

# Toggle the lightSprite and collision; triggered via lightSwitch
func _toggleLight():
		collision.set_deferred("disabled", !collision.disabled)
		sprite.visible = !sprite.visible
