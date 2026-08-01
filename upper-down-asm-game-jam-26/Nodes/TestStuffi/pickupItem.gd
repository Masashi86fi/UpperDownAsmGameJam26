extends Area2D
@onready var sprite = $ItemSprite #Item sprite reference
@onready var collision = $CollisionShape2D #Collision reference
@export var itemName: String #Itemname; set via inspector

# On trigger; player pickups the item, UI is toggled and the pickup is disabled
func _on_body_entered(body):
	if body.name == "DarkPlayer":
		print("Player pickup item!")
		body._pickupItem(sprite.texture, itemName)
		Dialogue._addItem(itemName, sprite.texture)
		visible = false
		collision.set_deferred("disabled", true)
