class_name LightSource
extends Area2D

@onready var collision = $CollisionShape2D
@onready var sprite = $LightSprite
@export var enabledAtStart: bool = false
@export var respawnPoint: Node2D

func _ready():
	if enabledAtStart == false:
		collision.set_deferred("disabled", true)
		sprite.visible = true
	else:
		collision.set_deferred("disabled", false)
		sprite.visible = false

func _on_body_entered(body: CharacterBody2D):
	if body.name == "DarkPlayer":
		body.global_position = respawnPoint.global_position
		
func _toggleLight():
		collision.set_deferred("disabled", !collision.disabled)
		sprite.visible = !sprite.visible
