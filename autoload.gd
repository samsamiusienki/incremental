extends Node

#GLOBAL VARIABLES to access from other scripts

var points: float = 0:
	set(value):
		#safeguard żeby points nigdy nie były poniżej 0
		points = max(0, value)
		
