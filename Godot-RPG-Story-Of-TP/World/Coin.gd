extends Node2D
signal level_1_complete
onready var Level_1 = $"/root/PlayerStats"
func _on_Lootbox_area_entered(area):
	queue_free()
	emit_signal("level_1_complete")
	

func _on_Coin_level_1_complete():
	Level_1.Level_1= true
