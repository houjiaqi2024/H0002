# Player.gd
extends CharacterBody2D

@onready var character

# 通用属性
var STATS = {
	"MAX_HEALTH": 100.0,
	"HEALTH": 100.0,
	"SPEED": 600
}

var health: int

# 处理输入
func handle_input(delta):
	# Movement
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * STATS.SPEED
	move_and_slide()
	
