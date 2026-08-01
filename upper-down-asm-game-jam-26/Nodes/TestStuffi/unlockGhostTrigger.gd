extends Area2D

#@export var player: Node2D
@onready var sprite = $Sprite2D #Reference to ghostUnlock pickup sprite
@onready var collision = $CollisionShape2D #Reference to collision


# Player touches ghostUnlock item; unlock swapping character and hide item sprite+disable collision
func _on_body_entered(body):
	if body.name == "LightPlayer":
		print("GHOST UNLOCKED")
		collision.set_deferred("disabled", true)
		visible = false
		var player = body.get_parent()
		player.ghostUnlocked = true
