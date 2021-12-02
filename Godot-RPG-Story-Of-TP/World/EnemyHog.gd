extends YSort

var hedgehog = preload("res://Enemies/hedgehog.tscn")
func spawn_enemy(x):
	var enemy = hedgehog.instance()
	enemy.global_position = x
	add_child(enemy)

func _on_Timer_respawn():
	spawn_enemy(Vector2(rand_range(190,200),rand_range(190, 200)))
