extends Node

func _ready() -> void:
	Input.set_custom_mouse_cursor(load("res://2d assets/art/jajo_cursor.png"))
	##hover
	#Input.set_custom_mouse_cursor(load("blahh.png"), Input.CURSOR_POINTING_HAND)
	##pressed
	#Input.set_custom_mouse_cursor(load("blahh.png"), Input.CURSOR_BUSY)
