extends Area2D
@onready var sprite = $ItemSprite
@onready var collision = $CollisionShape2D
@export var itemName: String

func _on_body_entered(body):
	if body.name == "DarkPlayer":
		print("Player pickup item!")
		body._pickupItem(sprite.texture, itemName)
		Dialogue._addItem(itemName, sprite.texture)
		visible = false
		collision.set_deferred("disabled", true)
