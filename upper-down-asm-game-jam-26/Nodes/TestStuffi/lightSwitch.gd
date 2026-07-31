extends Area2D

@export var lights: Array[LightSource]

func _on_body_entered(body):
	if body.name == "LightPlayer":
		body.currentInteractable = self
		print("PLAYER NEAR SWITCH")
		Dialogue.toggleInteractUI(true)

func _on_body_exited(body):
	if body.name == "LightPlayer" and body.currentInteractable == self:
		body.currentInteractable = null
		print("PLAYER COME BACK :(")
		Dialogue.toggleInteractUI(false)

func interact():
	print("TURNING ON ", lights.size(), "x LIGHTS!")
	for light in lights:
		light._toggleLight()
