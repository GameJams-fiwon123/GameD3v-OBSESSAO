extends KinematicBody2D

var motion = Vector2()
var speed = 300

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	move()
	move_and_slide(motion * speed)

func move():
	if Input.is_action_pressed("right"):
		motion.x = 1
	elif Input.is_action_pressed("left"):
		motion.x = -1
	else:
		motion.x = 0
		
	if Input.is_action_pressed("down"):
		motion.y = 1
	elif Input.is_action_pressed("up"):
		motion.y = -1
	else:
		motion.y = 0