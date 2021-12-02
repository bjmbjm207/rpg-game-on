extends Timer

signal respawn

func want_to_respawn():
	emit_signal("respawn") 
