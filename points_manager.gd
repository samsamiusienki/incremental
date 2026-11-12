extends Node2D
class_name PointsManager

#notatki pierwsze zaj:
# na nastepnych zajęciach automatyczne klikanie

#int - liczba całkowita
#float - liczba z przecinkiem
#bool - ma tylko dwa tryby true/false

## // do pisania komentarzy w unity i ## do pisania w godocie


#private variables
#int - liczba całkowita, float - liczba z przecinkiem
#var points: int = 0 # =0 to przepisanie wartości
var pointsPerClick: float = 1;
var upgradeCost: float = 10;
#nowe rzeczy z 15.10, timer do autoclick
var pointsPerSecond: float = 1
var perSecondUpgradeCost: float = 10
var pointsAddInterval: float = 1
@onready var timer = $"../PerSecondTimer"
@onready var JajoAnimationPlayer = $"../CookieScene/AnimationPlayer"


#nodes from scene, as vars so you can change their names or order instead of
#updating a shit ton of lines to a new file name!

#total points text
@onready var pointsLabel = $"../StatsUI/HBoxContainer5/HBoxContainer/PointsLabel"
#upgrade cost text
@onready var upgradeCostLabel = $"../StatsUI/HBoxContainer5/HBoxContainer2/UpgradeCostLabel"
#pts per click text
@onready var ptsPerClickLabel = $"../StatsUI/HBoxContainer5/HBoxContainer3/PtsPerClickLabel"
#upgrade button
@onready var upgradeButton = $"../UpgradeButton"
#nowe z 15.10
@onready var perSecondUpgradeButton = $"../PerSecondUpgradeButton"
@onready var pointsAutoclickLabel =  $"../StatsUI/HBoxContainer5/HBoxContainer4/PtsAutoclickLabel"

#SKRYPTY
@onready var AudioManager = $"../AudioManager"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_update_persecond_upgradecost_label()
	_update_upgradecost_label()
	_update_ptsperclick_label()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	_update_points_label()
	_update_ptsperclick_label()
	#disabling the upgrade buttons if you dont have enough points
	upgradeButton.disabled = (Autoload.points < upgradeCost)
	perSecondUpgradeButton.disabled = (Autoload.points < perSecondUpgradeCost)
	
func _add_points_autoclick() -> void:
	Autoload.points += pointsPerSecond
	_update_points_label()
	pointsAutoclickLabel.text = str(_translate_big_number(pointsPerSecond))
	#nie można by default ustawić int jako text dlatego robi się
	# = str(tutaj coś) żeby się przekonwertowało
	print("points:", Autoload.points)
	#dodawanie pointów przez autoclick
	
func _update_persecond_upgradecost_label() -> void:
	perSecondUpgradeButton.text = str("AUTOCLICK\nUPGRADE (", _translate_big_number(perSecondUpgradeCost), ")")

func _upgrade_autoclick() -> void:
	#logic for upgrading how much points you get from timed autoclick
	if (_try_spend_points(perSecondUpgradeCost)):
		perSecondUpgradeCost *= 2 #razy dwa
		pointsPerSecond *= 2 #razy dwa
		_update_persecond_upgradecost_label()
	#stary kod:
	#if (points >= perSecondUpgradeCost):
		#points -= perSecondUpgradeCost
		#perSecondUpgradeCost *= 2 #razy dwa
		#pointsPerSecond *= 2 #razy dwa
		#_update_points_label()
		#_update_persecond_upgradecost_label()

func _add_points() -> void:
	#logic for when you click the cookie
	Autoload.points += pointsPerClick
	_update_points_label()
	print("points:", Autoload.points)
	
func _update_points_label() -> void:
	pointsLabel.text = str(_translate_big_number(Autoload.points))
	#^ this updates the text so it shows correct amount of total points
	
func _update_ptsperclick_label() -> void:
	ptsPerClickLabel.text = str(_translate_big_number(pointsPerClick))
	#this updates the text so it shows correct amount

func _update_upgradecost_label() -> void:
	upgradeCostLabel.text = str(_translate_big_number(upgradeCost))
	upgradeButton.text = str("PERCLICK\nUPGRADE (", _translate_big_number(upgradeCost), ")")
	#this updates the text so it shows correct amount

func _upgrade_pointsPerClick() -> void:
	#logic for upgrading how much points you get from one click
	if (_try_spend_points(upgradeCost)):
		upgradeCost *= 2 #razy dwa
		pointsPerClick *= 2 #razy dwa
		_update_ptsperclick_label()
		_update_upgradecost_label()
	
	#stary kod:
	#if (points >= upgradeCost):
		#points -= upgradeCost
		#upgradeCost *= 2 #razy dwa
		#pointsPerClick *= 2 #razy dwa
		#_update_ptsperclick_label()
		#_update_points_label()
		#_update_upgradecost_label()

func _try_spend_points(amount: int):
	if (Autoload.points >= amount):
		Autoload.points -= amount
		_update_points_label()
		print("_try_spend_points true")
		return true
	else:
		print("_try_spend_points false")
		return false
#i dunno

#actually connecting this code to pressing stuff in the scene is below:

func _on_cookie_button_pressed() -> void:
	JajoAnimationPlayer.play("c_click_animation")
	AudioManager._play_clicksfx()
	_add_points()
	#co sie dzieje gdy klikasz ciastko

func _on_upgrade_button_pressed() -> void:
	_upgrade_pointsPerClick()
	#co sie dzieje gdy klikasz per click upgrade button

#15.10
func _on_per_second_timer_timeout() -> void:
	print("timer finished!")
	_add_points_autoclick()
	#timer czeka 1s i wysyła sygnał który aktywuje tą funkcję, on loop

func _on_per_second_upgrade_button_pressed() -> void:
	_upgrade_autoclick()
	#co sie dzieje gdy klikasz autoclick upgrade button
	
func _translate_big_number(value: float) -> String:
	#da big numberz
	const MILLION = 1_000_000.0
	const BILLION = 1_000_000_000.0
	const TRILLION = 1_000_000_000_000.0
	
	#trillion
	if value >= TRILLION:
		var base = int(value / TRILLION)
		var reszta = int(fmod(value, TRILLION)) #dzieli x przez y and returns reszta
		if reszta > 0:
			return str(base, " trillion + ", reszta)
			#np 3 trillion + 37
		else:
			return str(base, " trillion")
			#np 3 trillion
	elif value >= BILLION:
		var base = int(value / BILLION)
		var reszta = int(fmod(value, BILLION)) #dzieli x przez y and returns reszta
		if reszta > 0:
			return str(base, " billion + ", reszta)
			#np 3 billion + 37
		else:
			return str(base, " billion")
			#np 3 billion
	elif value >= MILLION:
		var base = int(value / MILLION)
		var reszta = int(fmod(value, MILLION)) #dzieli x przez y and returns reszta
		if reszta > 0:
			return str(base, " million + ", reszta)
			#np 3 million + 37
		else:
			return str(base, " million")
			#np 3 million
	else:
		return str(int(value))
		#return normalny value

		
func _on_go_back_button_pressed() -> void:
	get_tree().change_scene_to_file("res://main_menu.tscn")
	
