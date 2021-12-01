extends YSort

var hedgehog = preload("res://Enemies/hedgehog.tscn")
func spawn_enemy(x):
	var enemy = hedgehog.instance()
	enemy.global_position = x
	add_child(enemy)

