# Path2D.gd
extends Path2D

var radius = 2000  # 圆的半径
var points = 64       # 圆的点数，越多越平滑

func _ready():
	var curve = Curve2D.new()
	
	for i in range(points):
		var angle = 2.0 * PI * float(i) / float(points)
		var x = radius * cos(angle)
		var y = radius * sin(angle)
		curve.add_point(Vector2(x, y))
	
	curve.add_point(Vector2(radius, 0))  # 闭合路径

	self.curve = curve
