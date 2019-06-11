extends CanvasLayer

var life_empty = "res://GFX/Coracao_vazio.png"

onready var lifes = $Lifes

var quantity_ref = 3

var index = 2

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.hud = self

func change_life(quantity):
	quantity_ref = quantity
	$AnimationPlayer.play("broke_heart")

func heart_broken():
	lifes.set_item_icon(quantity_ref, load(life_empty))