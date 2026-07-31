extends Area2D

@onready var collision = $CollisionShape2D
@export var doorReference: Control
@export var itemRequired: String

func _on_body_entered(body):
	if body.name == "DarkPlayer" && body.currentItem == itemRequired:
		print("Door is open")
		doorReference._doorOpen()
		collision.set_deferred("disabled", true)
		body._removeItem()
		Dialogue._hideItem()
