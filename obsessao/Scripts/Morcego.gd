extends RigidBody2D

var speed = 300

var motion = Vector2()
var can_change = true

onready var destinations_position = [$Position.global_position,
									 $Position2.global_position]
									
var index = 0
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	motion = (destinations_position[index] - global_position).normalized()
	
	if destinations_position[index].distance_to(global_position) <= 10:
		match index:
			0:
				index = 1
			1:
				index = 0
	
	global_position += motion * speed * delta
