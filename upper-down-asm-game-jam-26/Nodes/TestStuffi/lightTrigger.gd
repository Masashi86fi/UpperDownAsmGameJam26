extends Area2D

@onready var collision = $CollisionShape2D
@export var enabledAtStart: bool = false
@export var respawnPoint: Node2D

func _ready():
	if enabledAtStart == false:
		collision.set_deferred("disabled", true)
	else:
		collision.set_deferred("disabled", false)

func _on_body_entered(body: CharacterBody2D):
	if body.name == "DarkPlayer":
		body.global_position = respawnPoint.global_position
		
func _toggleLight(state: bool):
	if state:
		collision.set_deferred("disabled", false)
	else:
		collision.set_deferred("disabled", true)
		
