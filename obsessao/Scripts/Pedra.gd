extends RigidBody2D

onready var audio = $AudioStreamPlayer

var base_speed = 600
var speed = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_position.x -= speed * delta