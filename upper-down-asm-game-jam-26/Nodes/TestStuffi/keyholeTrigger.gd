extends Area2D

@export var doorReference: Control
@export var doorCollisionReference: CollisionShape2D
@export var itemRequired: String

func _on_body_entered(body):
	if body.name == "DarkPlayer" && body.currentItem == itemRequired:
		print("Door is open")
		doorCollisionReference.set_deferred("disabled", true)
		doorReference.visible = false
		body._removeItem()
		Dialogue._hideItem()
