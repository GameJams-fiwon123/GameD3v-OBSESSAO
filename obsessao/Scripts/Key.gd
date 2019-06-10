extends KinematicBody2D

var base_speed = 400
var speed = 400

var motion = Vector2()
var possible_destination = []
var path = []
var destination = Vector2()

onready var sprite = $Sprite

export var walk_slowdown = 0.5
export var nav_stop_treshold = 5

var index = 0

onready var navigation = Global.navigation
onready var available_destinations = Global.destinations

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.key = self
	possible_destination = available_destinations.get_children()
	make_path()

func _process(delta):
	navigate()
	
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


func _on_DetectorWin_body_entered(body):
	get_tree().change_scene(Global.FINAL)


func _on_Timer_timeout():
	speed = base_speed


func _on_DetectLight_body_entered(body):
	Global.ghost.speed = Global.ghost.base_speed


func _on_DetectLight_body_exited(body):
	Global.ghost.speed = Global.ghost.high_speed



func _on_TimerPiscada_timeout():
	sprite.play("close")


func _on_Sprite_animation_finished():
	if sprite.animation == "close":
		sprite.play("open")
