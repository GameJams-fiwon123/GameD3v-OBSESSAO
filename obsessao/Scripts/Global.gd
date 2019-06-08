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
var GAME_OVER = "res://Scenes/Screens/GameOver.tscn"
var VICTORY = "res://Scenes/Screens/Victory.tscn"

#Level
var LEVEL1 = "res://Scenes/Level/Level1.tscn"