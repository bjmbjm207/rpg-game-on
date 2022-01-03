extends Node

export(float) var max_health = 3 setget set_max_health
onready var health = max_health setget set_health
var Level_1 = false
var Level_2 = false
var Level_3 = 0
var Level_4 = false
var Level_5 = false
onready var timer = $"Timer"
signal no_health
signal health_changed(value)
signal max_health_changed(value)

func set_max_health(value):
	max_health = value
	#self.heath= min (health, max_health)
	emit_signal("max_health_changed", max_health)
func _process(delta):
	pass
func set_health(value): 
	health = value
	emit_signal("health_changed", health)
	if health <=0:
		emit_signal("no_health")
		timer.start(4)
		print("Choi lai sau 4s")
func _ready():
	self.health = max_health

