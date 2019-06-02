extends Area2D

var can_jump = false
var player = null

func _on_Buraco_body_entered(body):
	body.speed = 0
	body.global_position = global_position
	player = body
	$Timer.start()

func _input(event):
	if Input.is_action_just_pressed("jump") and can_jump:
		player.speed = 200
		

func _on_Timer_timeout():
	can_jump = true
