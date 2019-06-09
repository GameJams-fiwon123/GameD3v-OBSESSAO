extends KinematicBody2D

var lifes = 3

onready var sprite = $AnimatedSprite

var motion = Vector2()

var base_speed = 400
var speed = 400

var is_dead = false

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.player = self

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not is_dead:
		move()
		move_and_slide(motion * speed)

func move():
	motion.x
	if Input.is_action_pressed("right"):
		motion.x = 1.2
		sprite.play("vertical")
		sprite.flip_h = false
	elif Input.is_action_pressed("left"):
		motion.x = -1.2
		sprite.play("vertical")
		sprite.flip_h = true
	else:
		motion.x = 1
		
	if Input.is_action_pressed("down"):
		motion.y = 1
		sprite.play("down")
	elif Input.is_action_pressed("up"):
		motion.y = -1
		sprite.play("up")
	else:
		motion.y = 0
		
func dead():
	is_dead = true
	sprite.play("dead")

func _on_AnimatedSprite_animation_finished():
	if sprite.animation == "dead":
		get_tree().change_scene(Global.GAME_OVER)
