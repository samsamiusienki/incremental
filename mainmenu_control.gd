extends Control

#MAIN MENU SCRIPT

@onready var MainMenu = $"../MainMenu"
@onready var CreditsMenu = $"../CreditsPanel"
@onready var MusicPlayer = $"../MusicPlayer"
@onready var SFX1Player = $"../SFX1Player"

var next_scene = preload("res://main_scene.tscn")

func _on_start_button_pressed() -> void:
	SFX1Player.play()
	get_tree().change_scene_to_packed(next_scene)

func _on_credits_button_pressed() -> void:
	SFX1Player.play()
	MainMenu.visible = false
	CreditsMenu.visible = true

func _on_quit_button_pressed() -> void:
	SFX1Player.play()
	get_tree().quit()

func _on_exit_credits_pressed() -> void:
	SFX1Player.play()
	MainMenu.visible = true
	CreditsMenu.visible = false
