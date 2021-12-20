extends Label

onready var playerStats = PlayerStats



func _process(delta):
	if playerStats.Level_1 == false:
		self.text = "Noi chuyen voi su phu"
		self.show()
	if playerStats.Level_1 == true and playerStats.Level_2 == false:
		self.text = "Tim bi kip vo cong : Hoan thanh"
	if playerStats.Level_2 == true and playerStats.Level_3 <=5:
		self.text = "Tieu diet nhim rung " + String(playerStats.Level_3) + " / 5"
	if playerStats.Level_3 >=5 and playerStats.Level_4 == false:
		self.text = "Tieu diet nhim rung: Hoan thanh "
		
	
	
	
