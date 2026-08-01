extends Area2D

@onready var collision = $CollisionShape2D #Collision reference
@export var doorReference: Control #Reference to the door parent Node; set via inspector
@export var itemRequired: String #ItemName required to open door; set via Inspector

#If player triggers with correc item; open the reference door, disable keyhole and carried item from player
func _on_body_entered(body): 
	if body.name == "DarkPlayer" && body.currentItem == itemRequired:
		print("Door is open")
		doorReference._doorOpen() #Open the door
		collision.set_deferred("disabled", true) #Disable collision
		body._removeItem() #hide player item and remove it from inventory
		Dialogue._hideItem() #hide current item UI (Yes it's also UI Manager now)
