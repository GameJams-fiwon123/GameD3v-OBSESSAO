extends KinematicBody2D

var speed = 150

var motion = Vector2()
var possible_destination = []
var path = []
var destination = Vector2()

onready var player = Global.player


func _process(delta):
	motion = player.global_position - global_position 
	if motion.x >= 0:
		$Sprite.flip_h = false
	else:
		$Sprite.flip_h = true
	move_and_slide(motion.normalized() * speed)