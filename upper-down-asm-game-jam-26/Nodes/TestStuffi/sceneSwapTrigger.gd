extends Area2D

@export var sceneRoute: PackedScene #Reference to scene to swap to; set via inspector

# Light player hits trigger; load the referenced level/scene
func _on_body_entered(body):
	if body.name == "LightPlayer":
		print("SWAP LEVEL TO ", sceneRoute)
		get_tree().change_scene_to_packed(sceneRoute)
