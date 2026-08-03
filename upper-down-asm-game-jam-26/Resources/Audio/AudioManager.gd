extends Node

@onready var music_player: AudioStreamPlayer = $MusicPlayer
@onready var menu_sfx_player : AudioStreamPlayer = $MenuFXPlayer
@onready var footstep_player : AudioStreamPlayer = $FootStepPlayer
@onready var jump_player : AudioStreamPlayer = $JumpPlayer

var music_tween : Tween

const DEFAULT_DB = 0.0
const SILENT_DB = -80.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func play_music(stream :AudioStream):
	
	stop_tween()
	music_player.stop()
	music_player.stream = stream
	music_player.volume_db = DEFAULT_DB
	music_player.play()
	
func play_footstep(stream: AudioStream):
	footstep_player.stream = stream
	footstep_player.play()
	

	
	
func play_jump(stream: AudioStream):
	jump_player.stream = stream
	jump_player.play()

func play_menu_FX(stream: AudioStream):
	if menu_sfx_player.stream == stream:
		return
	menu_sfx_player.stream = stream
	menu_sfx_player.play()

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
	
func stop_tween():
	if music_tween:
		music_tween.kill()
		
func fade_in_music(stream: AudioStream, duration: float):
	stop_tween()
	music_player.stop()
	
	music_player.stream = stream
	music_player.volume_db = SILENT_DB
	music_player.play()
	
	music_tween = create_tween()
	music_tween.tween_property(
		music_player,
		"volume_db",
		DEFAULT_DB,
		duration
	)


func fade_out_music(duration: float):
	stop_tween()
	music_tween = create_tween()
	
	music_tween.tween_property(
		music_player,
		"volume_db",
		SILENT_DB,
		duration
	)
	
	await music_tween.finished
	
	music_player.stop()
	music_player.volume_db = DEFAULT_DB
