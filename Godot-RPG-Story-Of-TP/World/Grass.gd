extends Node2D
var GrassEffect = preload("res://Effects/GrassEffect.tscn")
var Coin = load("res://World/Coin.tscn")
signal show
func create_grass_effect():
	var grassEffect = GrassEffect.instance()
	get_parent().add_child(grassEffect) 
	grassEffect.global_position = global_position
	queue_free()


func _on_Hurtbox_area_entered(area):
	create_grass_effect()
	queue_free()
	emit_signal("show")
func _on_Grass5_show():
	var coin = Coin.instance()
	get_parent().add_child(coin)
	coin.global_position = global_position
