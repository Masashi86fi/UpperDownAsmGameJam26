extends Node2D

@onready var doorSprite = $StaticBody2D/Sprite2D
@onready var doorCollision = $StaticBody2D/CollisionShape2D

func _doorOpen():
	doorCollision.set_deferred("disabled", true)
	doorSprite.visible = false
