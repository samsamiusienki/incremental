extends AudioStreamPlayer

#SFX
var clickSound = load("res://sound/sfx/click_sound.mp3")
var wrongSound = load("res://sound/sfx/wrong_sound.mp3")
var sparkleSound = load("res://sound/sfx/sparkle_sound.mp3")

#AUDIO PLAYERS
@onready var MusicPlayer = $"../MusicPlayer"
@onready var SFX1Player = $"../SFX1Player"
@onready var SFX2Player = $"../SFX2Player"
@onready var SFX3Player = $"../SFX3Player"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SFX1Player.stream = clickSound
	SFX2Player.stream = wrongSound
	SFX3Player.stream = sparkleSound

#dzwiek klikania
func _play_clicksfx():
	SFX1Player.play()
	
#2nd sfx layer
func _play_sfx2():
	SFX2Player.play()
	
#3rd sfx layer
func _play_sfx3():
	SFX3Player.play()
	
	
