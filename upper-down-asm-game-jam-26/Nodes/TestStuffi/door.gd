extends Node2D

@onready var doorSprite = $StaticBody2D/Sprite2D # Reference to door sprite 
@onready var doorCollision = $StaticBody2D/CollisionShape2D # Reference to door collision

# Open door (triggered via keyholeTriggers)
func _doorOpen():  
	doorCollision.set_deferred("disabled", true) #Disable collision
	doorSprite.visible = false #Hide the grapghics (swap to sprite stuff probably?)
