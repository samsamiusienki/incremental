extends TextureButton

#item in shop code

#VARIABLES#

@onready var timer = $"../../../../../../../PerSecondTimer"
@onready var CantAffordLabel = $"../../../../CantAffordLabel"
@onready var CostHint = $"../../../../CostHint"
@onready var PointsManagerNode = $"../../../../../../../PointsManager"
@onready var CookieButton = $"../../../../../../../CookieScene/AspectRatioContainer/CookieButton"
@onready var ItemDescriptionPanel = $"../../../../../../../DescriptionPanel"
@onready var ItemDescriptionLabel = $"../../../../../../../DescriptionPanel/Description"

@onready var AudioManager = $"../../../../../../../AudioManager"
@onready var JajoAnimationPlayer = $"../../../../../../../CookieScene/AnimationPlayer"

var enoughPoints: bool

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _hide_popups():
	CantAffordLabel.visible = false

#func _buy_a_thing(cost: int):
	#cost = get_meta("ItemMetaCost")
	#if (Autoload.points > cost):
		#print("bought a jajo")
		#matching bullshit
	#else:
		#CantAffordLabel.visible = true
		#print("cant buy")

func _on_pressed() -> void:
	AudioManager._play_clicksfx()
	var cost = get_meta("ItemMetaCost")
	if (Autoload.points >= cost):
		Autoload.points -= cost
		print("bought a jajo")
		_match_meta_name() #matching nazwe w metadata
		AudioManager._play_sfx3()
		JajoAnimationPlayer.play("c_click_animation")
	else:
		CantAffordLabel.visible = true
		AudioManager._play_sfx2()
		print("cant buy jajo")
		
func _match_meta_name():
	match get_meta("ItemMetaName"):
		"Bajo":
			print("bought bajo jajo")
			CookieButton.texture_normal = load("res://2d assets/jajo skins/bajo_jajo.png")
			CookieButton.texture_click_mask = load("res://2d assets/jajo skins/basic_jajo_clickmask.png")
		"Bald":
			print("bought bald jajo")
			CookieButton.texture_normal = load("res://2d assets/jajo skins/bald_jajo.png")
			CookieButton.texture_click_mask = load("res://2d assets/jajo skins/basic_jajo_clickmask.png")
		"Basic":
			print("bought basic jajo")
			CookieButton.texture_normal = load("res://2d assets/jajo skins/basic_jajo.png")
			CookieButton.texture_click_mask = load("res://2d assets/jajo skins/basic_jajo_clickmask.png")
		"Christmas":
			print("bought christmas jajo")
			CookieButton.texture_normal = load("res://2d assets/jajo skins/christmas_jajo.png")
			CookieButton.texture_click_mask = load("res://2d assets/jajo skins/christmas_jajo_clickmask.png")
		"Closet":
			print("bought closet jajo")
			CookieButton.texture_normal = load("res://2d assets/jajo skins/closet_jajo.png")
			CookieButton.texture_click_mask = load("res://2d assets/jajo skins/closet_jajo_clickmask.png")
		"Cooler":
			print("bought cooler jajo")
			CookieButton.texture_normal = load("res://2d assets/jajo skins/cooler_jajo.png")
			CookieButton.texture_click_mask = load("res://2d assets/jajo skins/basic_jajo_clickmask.png")
		"Eggman":
			print("bought eggman jajo")
			CookieButton.texture_normal = load("res://2d assets/jajo skins/eggman_jajo.png")
			CookieButton.texture_click_mask = load("res://2d assets/jajo skins/eggman_jajo_clickmask.png")
		"Halloween":
			print("bought halloween jajo")
			CookieButton.texture_normal = load("res://2d assets/jajo skins/halloween_jajo.png")
			CookieButton.texture_click_mask = load("res://2d assets/jajo skins/halloween_jajo_clickmask.png")
		"JajoJajo":
			print("bought jajo jajo")
			CookieButton.texture_normal = load("res://2d assets/jajo skins/jajo_jajo.png")
			CookieButton.texture_click_mask = load("res://2d assets/jajo skins/basic_jajo_clickmask.png")
		"JoJajo":
			print("bought góral jajo")
			CookieButton.texture_normal = load("res://2d assets/jajo skins/jo_jajo.png")
			CookieButton.texture_click_mask = load("res://2d assets/jajo skins/jo_jajo_clickmask.png")
		"Microtransaction":
			print("bought microtransaction jajo")
			CookieButton.texture_normal = load("res://2d assets/jajo skins/microtransaction_jajo.png")
			CookieButton.texture_click_mask = load("res://2d assets/jajo skins/basic_jajo_clickmask.png")
		"Mystery":
			print("bought mystery jajo")
			CookieButton.texture_normal = load("res://2d assets/jajo skins/mystery_jajo.png")
			CookieButton.texture_click_mask = load("res://2d assets/jajo skins/mystery_jajo_clickmask.png")
		"Summer":
			print("bought summer jajo")
			CookieButton.texture_normal = load("res://2d assets/jajo skins/summer_jajo.png")
			CookieButton.texture_click_mask = load("res://2d assets/jajo skins/summer_jajo_clickmask.png")
		"Void":
			print("bought void jajo")
			CookieButton.texture_normal = load("res://2d assets/jajo skins/void_jajo.png")
			CookieButton.texture_click_mask = load("res://2d assets/jajo skins/basic_jajo_clickmask.png")
		"Wielkanoc":
			print("bought wielkanoc jajo")
			CookieButton.texture_normal = load("res://2d assets/jajo skins/wielkanoc_jajo.png")
			CookieButton.texture_click_mask = load("res://2d assets/jajo skins/basic_jajo_clickmask.png")
		"Lucifer":
			print("bought lucyfer jajo")
			CookieButton.texture_normal = load("res://2d assets/jajo skins/lucyfer_jajo.png")
			CookieButton.texture_click_mask = load("res://2d assets/jajo skins/lucyfer_jajo_clickmask.png")
		"LionPrince":
			print("bought lion prince jajo")
			CookieButton.texture_normal = load("res://2d assets/jajo skins/lion_prince_jajo.png")
			CookieButton.texture_click_mask = load("res://2d assets/jajo skins/lion_prince_jajo_clickmask.png")
		_:
			print("this item has no meta name!")

func _on_per_second_timer_timeout() -> void:
	_hide_popups()

func _on_mouse_entered() -> void:
	#make description show up
	ItemDescriptionLabel.text = get_meta("ItemDescription")
	ItemDescriptionPanel.visible = true
	CostHint.text = str("COST: ", get_meta("ItemMetaCost"))
	
func _on_mouse_exited() -> void:
	#make item desc dissapear
	ItemDescriptionPanel.visible = false
