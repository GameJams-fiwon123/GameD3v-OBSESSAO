extends Node2D

var music = "res://SFX/Gameplay/Indiana_Joao_e_o_Templo_da_Perseguicao_-_Templo.ogg"

onready var a_input = $Buttons/A
onready var w_input = $Buttons/W
onready var s_input = $Buttons/S
onready var d_input = $Buttons/D

var is_a_input = false
var is_w_input = false
var is_s_input = false
var is_d_input = false

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
		if Input.is_action_just_pressed("right"):
			d_input.play("pressed")
		elif Input.is_action_just_pressed("left"):
			a_input.play("pressed")
		elif Input.is_action_just_pressed("up"):
			w_input.play("pressed")
		elif Input.is_action_just_pressed("down"):
			s_input.play("pressed")
		elif Input.is_action_just_released("right"):
			d_input.visible = false
			is_d_input = true
		elif Input.is_action_just_released("left"):
			a_input.visible = false
			is_a_input = true
		elif Input.is_action_just_released("up"):
			w_input.visible = false
			is_w_input = true
		elif Input.is_action_just_released("down"):
			s_input.visible = false
			is_s_input = true
			
		if is_a_input and is_w_input and is_s_input and is_d_input:
			start_game = true
			Global.ghost.start_animation()

func finish_animation():
		anim_finish = true
		$Buttons.visible = true
		
func win():
	start_game = false
	$AnimationPlayer.play("win")


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "win":
		get_tree().change_scene(Global.FINAL)
