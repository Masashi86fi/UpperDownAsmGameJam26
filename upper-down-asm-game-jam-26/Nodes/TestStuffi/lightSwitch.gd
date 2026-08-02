extends Area2D

@export var lights: Array[PointLight2D] # Reference to lights that switch toggles

# Lets LightPlayer know they can interact with switch+UI
func _on_body_entered(body):
	if body.name == "LightPlayer":
		body.currentInteractable = self
		print("PLAYER NEAR SWITCH")
		Dialogue.toggleInteractUI(true)

# Lets LightPlay know they can no longer interact with switch+UI
func _on_body_exited(body):
	if body.name == "LightPlayer" and body.currentInteractable == self:
		body.currentInteractable = null
		print("PLAYER COME BACK :(")
		Dialogue.toggleInteractUI(false)

# Toggles lights; triggered via LightPlayer interact key
func interact():
	print("TURNING ON ", lights.size(), "x LIGHTS!")
	for light in lights:
		if !light.enabled:
			light.enabled = true
		else:
			light.enabled = false
