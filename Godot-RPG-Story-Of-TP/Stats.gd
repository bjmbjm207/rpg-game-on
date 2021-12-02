extends Node

export(float) var max_health = 3 setget set_max_health
onready var health = max_health setget set_health
var Level_1 = false
signal no_health
signal health_changed(value)
signal max_health_changed(value)

func set_max_health(value):
	max_health = value
	#self.heath= min (health, max_health)
	emit_signal("max_health_changed", max_health)

func set_health(value): 
	health = value
	emit_signal("health_changed", health)
	if health <=0:
		emit_signal("no_health")

func _ready():
	self.health = max_health
	
