extends Control

var music = "res://SFX/Screen/Tela_Inicial.wav"

func _ready():
	Global.audio.stream = load(music)
	Global.audio.play()

func _on_ButtonStart_pressed():
	get_tree().change_scene(Global.LEVEL1)

func _on_ButtonCredits_pressed():
	get_tree().change_scene(Global.CREDITS)

func _on_ButtonExit_pressed():
	get_tree().quit()
