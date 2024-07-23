extends PatternSpawner


var player
@onready var path2d = $SpawnCircle

var time = 0
var timeSeconds = 0
var timeMinutes = 0

func _ready():
	var player_scence


	
	if Global.selected_character == "Biker":
		player_scence = preload("res://src/characters/biker/biker.tscn")
	player = player_scence.instantiate()
	add_child(player)
	player.position = Vector2(550, 320)


func _on_spawn_timer_timeout():
		if BetweenTime(0,0, 0,45):
			Random(1, 0.0)

func _physics_process(delta):
	if player:
		%SpawnCircle.position = player.position

# Time calculator helpers
func AtTime(minutes, seconds) -> bool:
	return (minutes * 60 + seconds) == time

func BetweenTime(startMinutes, startSeconds, endMinutes, endSeconds) -> bool:
	return (startMinutes * 60 + startSeconds) <= time && time <= endMinutes * 60 + endSeconds

func AfterTime(startMinutes, startSeconds):
	return (startMinutes * 60 + startSeconds) <= time


