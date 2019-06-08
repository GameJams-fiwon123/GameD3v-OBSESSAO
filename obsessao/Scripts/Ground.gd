extends Sprite

func _on_Detect_body_entered(body):
	$DetecOut/CollisionShape2D.disabled = false
	for item in $Arrows.get_children():
		item.speed = item.base_speed


func _on_DetecOut_area_entered(area):
	for item in $Arrows.get_children():
		area.queue_free()
