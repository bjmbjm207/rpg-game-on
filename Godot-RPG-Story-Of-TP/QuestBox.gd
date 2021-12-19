extends Area2D

var active = false 
onready var stats = PlayerStats
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var newTextBox = preload("res://UI/TextBox.tscn")
func _ready():
	connect("body_entered", self, '_on_NPC_body_entered')
	connect("body_exited", self, '_on_NPC_body_exited')	

func _process(delta):
	$QuestionMark.visible = active

func _input(event):
	if event.is_action_pressed("Talk") and active :
		if stats.Level_1 != true:
			var newTextbox = newTextBox.instance()
			newTextbox.queue_text("Master: Con vua di dau ve vay")
			newTextbox.queue_text("Tieu Phong: Con vua di an bat bun bo")
			newTextbox.queue_text("Master: Bay gio con da 25 tuoi roi")
			newTextbox.queue_text("Master: Ta se cho con biet ve cai chet cua cha me con")
			get_parent().get_parent().add_child(newTextbox)


func _on_NPC_body_entered(body):
	if body.name == 'Player':
		active = true

func _on_NPC_body_exited(body):
	if body.name == 'Player':
		active = false
	
