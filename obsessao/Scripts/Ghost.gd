extends Area2D

var base_speed = 900
var speed = 900

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
		
	global_position.y += motion.normalized().y * speed * delta

func _on_Ghost_body_entered(body):
	body.dead()
	
func start_animation():
	$Timer.start()

func _on_Timer_timeout():
	if not Global.game.is_win:
		$AnimationPlayer.play("default")
		$Timer.start()