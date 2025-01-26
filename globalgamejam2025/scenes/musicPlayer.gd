extends Node

@onready var musicAudioStreamBG = %BGMusic
@export var backgroundMusicOn = true
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	update_music_status()

func update_music_status():
	if backgroundMusicOn:
		if !musicAudioStreamBG.playing:
				musicAudioStreamBG.play()
		
