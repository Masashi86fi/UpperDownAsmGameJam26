extends Area2D

@export var sceneRoute: PackedScene

func _on_body_entered(body):
	if body.name == "LightPlayer":
		print("SWAP LEVEL TO ", sceneRoute)
		get_tree().change_scene_to_packed(sceneRoute)
