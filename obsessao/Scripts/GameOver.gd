extends Control

func _on_ButtonRetry_pressed():
	get_tree().change_scene(Global.LEVEL1)


func _on_ButtonExit_pressed():
	get_tree().change_scene(Global.MAIN_MENU)
