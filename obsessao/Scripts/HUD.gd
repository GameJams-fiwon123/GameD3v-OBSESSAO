extends CanvasLayer

var life_empty = "res://GFX/Coracao_vazio.png"

onready var lifes = $Lifes

var index = 2

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.hud = self

func change_life(quantity):
	lifes.set_item_icon(quantity, load(life_empty))
