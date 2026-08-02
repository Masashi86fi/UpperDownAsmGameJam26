extends Node2D

@onready var sprite_2d: Sprite2D = $StaticBody2D/Sprite2D

@onready var doorCollision = $StaticBody2D/CollisionShape2D # Reference to door collision


# Open door (triggered via keyholeTriggers)
func _doorOpen():  
	doorCollision.set_deferred("disabled", true) #Disable collision
	sprite_2d.visible = false #Hide the grapghics (swap to sprite stuff probably?)
