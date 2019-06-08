extends Area2D

func _on_Buraco_body_entered(body):
	body.speed = 0
	body.global_position = global_position
	$AudioStreamPlayer.play()
	body.dead()
	
