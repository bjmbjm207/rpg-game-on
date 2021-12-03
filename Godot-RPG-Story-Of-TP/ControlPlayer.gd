extends MarginContainer


func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().change_scene_to(load("res://MainMenu.tscn"))
