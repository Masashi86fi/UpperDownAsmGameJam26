extends Control

func resume():
	get_tree().paused = false
	
func pause():
	get_tree().paused = true
	
func testEsc():
	if Input.is_action_just_pressed("ui_close_dialog") and !get_tree().paused:
		pause()
	elif Input.is_action_just_pressed("ui_close_dialog") and get_tree().paused:
		resume()
