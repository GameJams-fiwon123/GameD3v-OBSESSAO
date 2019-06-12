extends KinematicBody2D

var base_speed = 400
var speed = 400

var motion = Vector2()
var possible_destination = []
var path = []
var destination = Vector2()

onready var sprite = $Sprite
onready var detector = $Detector/CollisionShape2D

export var walk_slowdown = 0.5
export var nav_stop_treshold = 10

var index = 0

onready var navigation = Global.navigation
onready var available_destinations = Global.destinations

onready var destinations_position = [Vector2(0, $Position.global_position.y),
									 Vector2(0, $Position2.global_position.y)]
									
var index2 = 0
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.game.start_game:
		
		if global_position.x <= 30300:
			var pos_ref = Vector2(0, global_position.y)
	
			if destinations_position[index2].distance_to(pos_ref) <= 10:
				match index2:
					0:
						index2 = 1
						motion.y = 0.5
					1:
						index2 = 0
						motion.y = -0.5
			
			motion.x = 1
			move_and_slide(motion * speed)
		elif $Camera2D.offset.x != 0:
			$Camera2D/AnimationPlayer.play("default")




# Called when the node enters the scene tree for the first time.
func _ready():
	Global.key = self
	match index2:
		0:
			index2 = 1
			motion.y = 0.5
		1:
			index2 = 0
			motion.y = -0.5
#	possible_destination = available_destinations.get_children()
#	make_path()

#func _process(delta):
#	navigate()
	
func navigate():
	var distance_to_destination = position.distance_to(path[0])
	destination = path[0]
	
	if distance_to_destination > nav_stop_treshold:
		move()
	else:
		update_path()
	
func move():
	motion = (destination-position).normalized() * speed
	
	if is_on_wall():
		make_path()
	
	move_and_slide(motion)

func make_path():
	if index < available_destinations.get_child_count():
		var next_destination = possible_destination[index]
		index += 1
		
		path = navigation.get_simple_path(global_position, next_destination.global_position, false)

func update_path():
	if path.size() == 1:
		make_path()
	else:
		path.remove(0)

func _on_Detector_body_entered(body):
	speed = base_speed * 2
	$Timer.start()
	detector.disabled = true


func _on_DetectorWin_body_entered(body):
	$Sprite.visible = false
	$Shadow.visible = false
	$Light2D.visible = false
	body.win()
	Global.game.win()


func _on_Timer_timeout():
	speed = base_speed
	detector.disabled = false



func _on_TimerPiscada_timeout():
	sprite.play("close")


func _on_Sprite_animation_finished():
	if sprite.animation == "close":
		sprite.play("open")



