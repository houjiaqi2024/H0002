class_name PatternSpawner
extends Node2D

const ENEMY = {
	BASEBALLGUY: preload("res://src/characters/ememies/baseballguy/baseballguy_mob.tscn"),
	BAT: preload("res://src/characters/ememies/baseballguy/baseballguy_mob.tscn")
}
const ENEMY_NAME = {
	BASEBALLGUY: "Baseballguy",
	BAT: "Baseballguy"
}

enum {BASEBALLGUY, BAT}
enum DIRECTION {PLAYER, MIDDLE, HOVER, UP, RIGHT, DOWN, LEFT}

var distance = 0.0	# The total distance between point a and point b
var step = 0.01226 		# The space between each spawned mobType

#设置新的敌人状态
func _set_stats(spawn, newStats):
	for stat in newStats:
		spawn.STATS[stat[0]] = stat[1]

#region Random spawning pattern
func Random(amount, delay): 
	for x in amount:
		RandomFullSpawner(randi_range(0, ENEMY.size() -1), [], 1, 0.00)
		if delay > 0.00:
			await get_tree().create_timer(delay).timeout

func RandomFullSpawner(mobType: int, newStats, amount: int, delay: float):
	for x in range(amount):
		var spawn = ENEMY[mobType].instantiate()
		#spawn.mobName = ENEMY_NAME[mobType]
		if newStats.size() != 0:
			_set_stats(spawn, newStats)
		%SpawnCircleFollow.progress_ratio = randf()
		spawn.global_position = %SpawnCircleFollow.global_position
		add_child(spawn)
		if delay > 0.00:
			await get_tree().create_timer(delay).timeout
#endregion

#region Circle sparning pattern
func CircleFullSpawner(mobType:int, newStats, amount:int, delay:float, 
						startDeg:float, endDeg:float, separate:bool, fill:bool):
	if startDeg < 0: startDeg = 0
	if endDeg < 0: endDeg = 360
	if startDeg < endDeg:	distance = (endDeg - startDeg) / 360.0
	if startDeg > endDeg:	distance = (360 - (startDeg - endDeg)) / 360.0
	
	if fill:	amount = distance / step # Places as many enemies as will fit in the area specified
	if separate: step = distance / (amount + 1)
	%SpawnCircleFollow.progress_ratio = (startDeg / 360.0) + step
	for x in amount:
		var spawn = ENEMY[mobType].instantiate()
		spawn.mobName = ENEMY_NAME[mobType]
		if newStats.size() != 0:
			_set_stats(spawn, newStats)
		spawn.global_position = %SpawnCircleFollow.global_position
		add_child(spawn)
		if %SpawnCircleFollow.progress_ratio + step > 1:
			var leftover = (%SpawnCircleFollow.progress_ratio + step) - 1
			%SpawnCircleFollow.progress_ratio = leftover
		else:
			%SpawnCircleFollow.progress_ratio += step
		if delay > 0.00:
			await get_tree().create_timer(delay).timeout
#endregion

#region Line Spawning patterns
func LineSpawner(mobType:int, newStats, amount:int, delay:float, direction:DIRECTION, separate:bool, fill:bool):
	var LINE = {
		DIRECTION.UP : %SpawnBelowFollow,
		DIRECTION.RIGHT : %SpawnLeftFollow,
		DIRECTION.DOWN : %SpawnAboveFollow,
		DIRECTION.LEFT : %SpawnRightFollow
	}
	distance = 1.0
	if fill: amount = distance / step
	if separate: step = distance / (amount + 1)
	newStats.append(["MOVE_TYPE", direction])
	for x in amount:
		var spawn = ENEMY[mobType].instantiate()
		spawn.mobName = ENEMY_NAME[mobType]
		if newStats.size() != 0:
			_set_stats(spawn, newStats)
		spawn.global_position = LINE[direction].global_position
		add_child(spawn)
		LINE[direction].progress_ratio += step
		if delay > 0.00:
			await get_tree().create_timer(delay).timeout
#endregion
