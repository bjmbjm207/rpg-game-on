extends Area2D

var active = false 
onready var playerStats = PlayerStats
onready var QuestUI = $"../../CanvasLayer/HealthUI/QuestUI"
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
		if playerStats.Level_1 != true:
			var newTextbox = newTextBox.instance()
			newTextbox.queue_text("Master: Con vua di dau ve vay")
			newTextbox.queue_text("Tieu Phong: Con vua di an bat bun bo")
			newTextbox.queue_text("Master: Bay gio con da 25 tuoi roi")
			newTextbox.queue_text("Master: Ta se cho con biet ve cai chet cua cha me con")
			newTextbox.queue_text("Master: Ngay xua luc ta dang di o chan nui Nhac Mon Quan")
			newTextbox.queue_text("Flash Back early game :V")
			newTextbox.queue_text("Master: Ta da thay cha me con bi mot dam nguoi phuc kich va giet hai khong thuong xot")
			newTextbox.queue_text("Master: Con thi duoc cha me de o chiec xe chan nui. Nen ta da mang con ve day cham soc")
			newTextbox.queue_text("Tieu Phong: That khong the tin duoc. Con chac chan se tim ra chan tuong su viec va tra thu cho cha me")
			newTextbox.queue_text("Master: Bay gio ta se day mot vai vo cong quan trong cho con de con vung buoc tren hanh trinh cua minh")
			newTextbox.queue_text("Tieu Phong: Vang thua su phu")
			newTextbox.queue_text("Master: Con hay len khu rung phia bac va tim kiem bi kip vo cong Lon nhao than chuong ta giau trong cac dam co")
			newTextbox.queue_text("Master: Can than bon nhim se tan cong con. Day la thu thach dau tien cua con")
			newTextbox.queue_text("Tieu Phong: Vang thua su phu. Con se di lam ngay")
			get_parent().get_parent().add_child(newTextbox)
		if playerStats.Level_1 ==true and playerStats.Level_2 == false:
			var newTextbox = newTextBox.instance()
			newTextbox.queue_text("Master: Bay gio con co the su dung phim Q de dung ki nang lon nhao")
			newTextbox.queue_text("Master: No se giup con di chuyen nhanh hon de tranh quai vat")
			playerStats.Level_3 = 0
			get_parent().get_parent().add_child(newTextbox)
		if playerStats.Level_2 ==true and playerStats.Level_3 <5 :
			var newTextbox = newTextBox.instance()
			newTextbox.queue_text("Master: Nhiem vu dau tien danh cho con. Tieu diet 5 con nhim tren khu rung phia Bac")
			get_parent().get_parent().add_child(newTextbox)
		if playerStats.Level_3 >=5 and playerStats.Level_4 == false:
			var newTextbox = newTextBox.instance()
			newTextbox.queue_text("Master: Con da lam rat tot nhiem vu")
			newTextbox.queue_text("Master: Vi chang duong phia truoc con dai")
			newTextbox.queue_text("Master: Con nen tim ban dong hanh, de chuyen hanh trinh phia truoc bot gian nan hon")
			newTextbox.queue_text("Master: Con di len sang phia dong gap ten Garou va danh bai han. Con se lay duoc ban do den Dao Meo")
			newTextbox.queue_text("Master: O day con se tim thay nguoi ban dong hanh cua minh")
			get_parent().get_parent().add_child(newTextbox)
			playerStats.Level_5 = true
		

func _on_NPC_body_entered(body):
	if body.name == 'Player':
		active = true

func _on_NPC_body_exited(body):
	if body.name == 'Player':
		active = false
	
