extends AnimatedSprite


func _ready():
	connect("animation_finished", self, "_on_animation_finished")
	frame = 0
	playing
func _on_animation_finished():
	queue_free()