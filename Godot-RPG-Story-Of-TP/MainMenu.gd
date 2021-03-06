extends MarginContainer


onready var selector_one = $CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CenterContainer/HBoxContainer/Selector
onready var selector_two = $CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CenterContainer6/HBoxContainer/Selector
onready var selector_three = $CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CenterContainer2/HBoxContainer/Selector
onready var selector_four = $CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CenterContainer5/HBoxContainer/Selector
onready var selector_five = $CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CenterContainer3/HBoxContainer/Selector
const SelectorSound = preload("res://SelectorSound.tscn")
var current_selection = 0

func _ready():
	set_current_selection(0)

func _process(delta):
	if Input.is_action_just_pressed("ui_down") and current_selection < 4:
		current_selection += 1
		set_current_selection(current_selection)
		var selectorSound = SelectorSound.instance()
		get_tree().current_scene.add_child(selectorSound)
	elif Input.is_action_just_pressed("ui_up") and current_selection > 0:
		current_selection -= 1
		set_current_selection(current_selection)
		var selectorSound = SelectorSound.instance()
		get_tree().current_scene.add_child(selectorSound)
	elif Input.is_action_just_pressed("ui_accept"):
		handle_selection(current_selection)
		var selectorSound = SelectorSound.instance()
		get_tree().current_scene.add_child(selectorSound)

func handle_selection(_current_selection):
	if _current_selection == 0:
		get_tree().change_scene_to(load("res://FlashBack.tscn"))
		queue_free()
	elif _current_selection == 1:
		print("Load Game")
	elif _current_selection == 2:
		print("Add options!")
	elif _current_selection == 3:
		print("Add Guide!")
		get_tree().change_scene_to(load("res://ControlPlayer.tscn"))
		queue_free()
	elif _current_selection == 4:
		get_tree().quit()

func set_current_selection(_current_selection):
	selector_one.text = ""
	selector_two.text = " "
	selector_three.text = ""
	selector_four.text = ""
	selector_five.text = ""
	if _current_selection == 0:
		selector_one.text = ">"
	elif _current_selection == 1:
		selector_two.text = ">"
	elif _current_selection == 2:
		selector_three.text = ">"
	elif _current_selection == 3:
		selector_four.text = ">"
	elif _current_selection == 4:
		selector_five.text = ">"
