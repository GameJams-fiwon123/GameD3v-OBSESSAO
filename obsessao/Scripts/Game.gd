extends Node2D

var music = "res://SFX/Gameplay/Indiana_Joao_e_o_Templo_da_Perseguicao_-_Templo.ogg"

var start_game = false
var anim_finish = false

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
		
func _input(event):
	if anim_finish and not start_game:
		if Input.is_action_just_pressed("move"):
			start_game = true
			$Label.visible = false
			Global.ghost.start_animation()

func finish_animation():
		anim_finish = true
		
func win():
	start_game = false
	$AnimationPlayer.play("win")


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "win":
		get_tree().change_scene(Global.FINAL)
