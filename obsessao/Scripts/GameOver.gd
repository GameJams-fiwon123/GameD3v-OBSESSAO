extends Control

var audio_stream = "res://SFX/Screen/game_over.wav"

func _ready():
	Global.audio.stream = load(audio_stream)
	Global.audio.play()

func _on_ButtonRetry_pressed():
	get_tree().change_scene(Global.LEVEL1)


func _on_ButtonExit_pressed():
	get_tree().change_scene(Global.MAIN_MENU)
