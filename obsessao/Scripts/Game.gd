extends Node2D

var music = "res://SFX/Gameplay/Indiana_Joao_e_o_Templo_da_Perseguicao_-_Templo.ogg"

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.game = self
	Global.audio.stream = load(music)
	Global.audio.play()

func do_damage():
	Global.player.lifes -= 1
	Global.hud.change_life(Global.player.lifes)
	
	if Global.player.lifes <= 0:
		Global.player.dead()