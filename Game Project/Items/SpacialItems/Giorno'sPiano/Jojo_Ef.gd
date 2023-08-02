extends Node2D

var someth = 0
var someth2 = 0

func _ready():
	pass
	
func _process(delta):
	
	if $AudioStreamPlayer2D.volume_db > 20 or someth2 ==1:
		$AudioStreamPlayer2D.volume_db -=0.1
		someth2 = 1
	else:
		$AudioStreamPlayer2D.volume_db +=0.1

func _on_Timer_timeout():
	if someth ==0:
		position.y +=2
		someth+=1
	else:
		position.y-=2
		someth-=1


func _on_Timer2_timeout():
	self.hide()
	$Timer3.start()


func _on_Timer3_timeout():
	$AudioStreamPlayer2D.stop()
