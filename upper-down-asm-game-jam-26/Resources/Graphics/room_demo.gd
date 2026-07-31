extends Node2D

@export var canvas_modulate: CanvasModulate
@export var isDark: = false
var white: =Color.hex(232323)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if isDark:
		$CanvasGroup/TileMapLayer.modulate = Color.hex64(364747)		
	else :
		$CanvasGroup/TileMapLayer.modulate = white
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
