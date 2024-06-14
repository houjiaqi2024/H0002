# Player.gd
extends CharacterBody2D

# 通用属性
var STATS = {
	"MAX_HEALTH": 100.0,
	"HEALTH": 100.0,
	"SPEED": 300
}

var health: int

# 处理输入
func handle_input(delta):
	# Movement
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * STATS.SPEED
	move_and_slide()

func animations():
	if velocity.length() > 0.0:
		play_run_animation(velocity)
	else:
		play_idle_animation()
		

func play_idle_animation():
	$Actions.animation = "idle"
	$Actions.play()

	
func play_run_animation(velocity):
	$Actions.animation = "run"
	$Actions.play()
	
	if velocity.x != 0:
		$Actions.animation = "run"
		$Actions.flip_v = false
		$Actions.flip_h = velocity.x < 0
