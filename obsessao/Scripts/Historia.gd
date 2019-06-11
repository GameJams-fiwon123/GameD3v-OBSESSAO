extends Control

var audio_stream = "res://SFX/Historia/Historia_1.1.ogg"

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.audio.stream = load(audio_stream)
	Global.audio.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_AnimationPlayer_animation_finished(anim_name):
	get_tree().change_scene(Global.LEVEL1)


func _on_ButtonSkip_pressed():
	get_tree().change_scene(Global.LEVEL1)
