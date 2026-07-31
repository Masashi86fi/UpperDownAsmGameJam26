extends Node

@onready var music = $MusicPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func play_music(stream :AudioStream):
	if music.stream == stream:
		return
	music.stream = stream
	music.play()
	

func set_music_volume(percent: float):
	var db = linear_to_db(percent);
	AudioServer.set_bus_volume_db(
		AudioServer.get_bus_index("Music"),
		db);


func set_sfx_volume(percent:float):
	var db = linear_to_db(percent);
	AudioServer.set_bus_volume_db(
	AudioServer.get_bus_index("SFX"),
	db);
	
func set_master_volume(percent:float):
	var mas = linear_to_db(percent);
	AudioServer.set_bus_volume_db(
		AudioServer.get_bus_index("Master"),
		mas);
	
	
