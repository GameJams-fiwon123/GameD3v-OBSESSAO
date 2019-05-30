extends KinematicBody2D

var speed = 300

var motion = Vector2()
var possible_destination = []
var path = []
var destination = Vector2()

export var walk_slowdown = 0.5
export var nav_stop_treshold = 5

onready var navigation = Global.navigation
onready var available_destinations = Global.destinations

onready var player = Global.player

# Called when the node enters the scene tree for the first time.
func _ready():
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
	motion = (destination-position).normalized() * (speed * walk_slowdown)
	
	if is_on_wall():
		make_path()
	
	move_and_slide(motion)

func make_path():
	path = navigation.get_simple_path(global_position, player.global_position, false)

func update_path():
	if path.size() == 1:
		make_path()
	else:
		path.remove(0)