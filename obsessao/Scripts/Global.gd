extends Node

var game
var hud

var player
var key
var ghost
var navigation
var destinations

onready var audio = $AudioStreamPlayer


#Scenes
var MAIN_MENU = "res://Scenes/Screens/MainMenu.tscn"
var CREDITS = "res://Scenes/Screens/Credits.tscn"
var HISTORIA = "res://Scenes/Screens/Historia.tscn"
var GAME_OVER = "res://Scenes/Screens/GameOver.tscn"
var FINAL = "res://Scenes/Screens/Final.tscn"

#Level
var LEVEL1 = "res://Scenes/Level/Level1.tscn"