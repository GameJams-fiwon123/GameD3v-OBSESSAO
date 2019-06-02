extends Area2D

func _on_Teia_body_entered(body):
	body.speed = 100


func _on_Teia_body_exited(body):
	body.speed = 200
