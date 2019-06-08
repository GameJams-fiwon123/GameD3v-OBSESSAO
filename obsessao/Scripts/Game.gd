extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.game = self

func do_damage():
	Global.player.lifes -= 1
	Global.hud.change_life(Global.player.lifes)
	
	if Global.player.lifes <= 0:
		Global.player.dead()