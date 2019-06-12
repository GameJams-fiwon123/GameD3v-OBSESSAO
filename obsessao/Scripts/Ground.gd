extends Sprite

func _on_Detect_body_entered(body):
	$DetecOut/CollisionShape2D.disabled = false
	for item in $Arrows.get_children():
		item.speed = item.base_speed
		item.audio.play()
	
	for item in $Pedras.get_children():
		item.speed = item.base_speed
		item.audio.play()


func _on_DetecOut_area_entered(area):
		area.queue_free()
