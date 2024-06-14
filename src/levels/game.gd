extends Node2D

@onready var player_scence = load("res://src/characters/biker/biker.tscn")
var player

func _ready():

	player = player_scence.instantiate()
	add_child(player)
	player.position = Vector2(550, 320)
