extends Control

func _on_ButtonStart_pressed():
	get_tree().change_scene(Global.LEVEL1)

func _on_ButtonCredits_pressed():
	get_tree().change_scene(Global.CREDITS)