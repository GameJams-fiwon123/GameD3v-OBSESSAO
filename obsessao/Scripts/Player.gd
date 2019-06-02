extends KinematicBody2D

onready var sprite = $AnimatedSprite

var motion = Vector2()
var speed = 200

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.player = self

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	move()
	move_and_slide(motion * speed)

func move():
	if Input.is_action_pressed("right"):
		motion.x = 1
		sprite.play("right")
	elif Input.is_action_pressed("left"):
		motion.x = -1
		sprite.play("left")
	else:
		motion.x = 0
		
	if Input.is_action_pressed("down"):
		motion.y = 1
		sprite.play("down")
	elif Input.is_action_pressed("up"):
		motion.y = -1
		sprite.play("up")
	else:
		motion.y = 0