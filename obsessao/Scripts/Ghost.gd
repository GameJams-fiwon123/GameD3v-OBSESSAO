extends Area2D

var high_speed = 510
var base_speed = 500
var speed = high_speed

var motion = Vector2()
var possible_destination = []
var path = []
var destination = Vector2()

onready var player = Global.player

func _ready():
	Global.ghost = self

func _process(delta):
	motion = player.global_position - global_position 
	if motion.x >= 0:
		$Sprite.flip_h = false
	else:
		$Sprite.flip_h = true
	global_position.x += motion.normalized().x * speed * delta
	global_position.y += motion.normalized().y * speed * delta

func _on_Ghost_body_entered(body):
	body.dead()
