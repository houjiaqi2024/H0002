extends Node2D


# 旋转速度（度/秒）
var rotation_speed: float = 90.0

# 角色的移动速度
var speed: float = 200.0

# 武器旋转半径
var weapon_radius: float = 50.0

# 武器的初始角度
var weapon_angle: float = 0.0

# 初始化
func _ready():
	position = Vector2(weapon_radius, 0)

func rotate_weapon(delta):
	# 更新武器的角度
	weapon_angle += rotation_speed * delta
	update_weapon_position()

func update_weapon_position():
	# 将角度转换为弧度
	var rad = deg_to_rad(weapon_angle)

	# 计算武器的新位置
	var weapon_position = Vector2(cos(rad), sin(rad)) * weapon_radius

	# 更新 WeaponPivot 的位置
	position = weapon_position
	
	# 更新武器的旋转角度，使其始终垂直于旋转路径
	rotation = rad + PI / 2  # PI/2 弧度等于90度，使其垂直于圆边
