extends Area2D


func _on_Spike_body_entered(body):
	Global.game.do_damage()
