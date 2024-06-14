extends "res://src/characters/player/Player.gd"

@onready var rotating_sword_scene := %RotatingSword

# 初始化
func _ready():
	health = STATS.MAX_HEALTH

func _physics_process(delta):
	handle_input(delta)
	animations()
	rotating_sword_scene.rotate_weapon(delta)
	

