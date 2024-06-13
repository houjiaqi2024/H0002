extends "res://src/characters/player/Player.gd"

var player_instance
# 初始化
func _ready():
	health = STATS.MAX_HEALTH

func _physics_process(delta):
	handle_input(delta)
	animations()
	

func animations():
	if velocity.length() > 0.0:
		play_run_animation(velocity)
	else:
		play_idle_animation()

func play_idle_animation():
	$AnimatedSprite2D.animation = "idle"
	$AnimatedSprite2D.play()

func play_run_animation(velocity):
	$AnimatedSprite2D.animation = "run"
	$AnimatedSprite2D.play()
	
	if velocity.x != 0:
		$AnimatedSprite2D.animation = "run"
		$AnimatedSprite2D.flip_v = false
		$AnimatedSprite2D.flip_h = velocity.x < 0
