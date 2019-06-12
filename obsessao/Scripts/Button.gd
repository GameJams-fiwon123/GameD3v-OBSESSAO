extends AnimatedSprite

var light_button_up = "res://GFX/Buttons/Light/light_button_up.png"
var light_button_pressed = "res://GFX/Buttons/Light/light_button_pressed.png"

func pressed_button():
	play("pressed")
	$Light2D.texture = load(light_button_pressed)
	
func up_button():
	play("up")
	$Light2D.texture = load(light_button_up)
