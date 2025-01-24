extends Node2D



onready var target_node = $Zem
export var points_per_second : int = 60

var trajectory_line : Line2D
var points : Array
var mapoints = 1800
var t = 0

func _ready():
	trajectory_line = Line2D.new()
	add_child(trajectory_line)
	trajectory_line.width = 1.5 # Ширина линии
	trajectory_line.default_color = Color(1, 0, 0, 0.5) # Цвет линии (красный с прозрачностью)


func _physics_process(_delta):
	if target_node.T:
		var pos = target_node.position
		update_trajectory(pos, _delta)

func update_trajectory(a : Vector2, de):
	t = t + de
	if t >= 0.1:
		t = 0
		if trajectory_line.get_point_count()+1 == mapoints:
			points.remove(0)
		points.append(a)
		trajectory_line.points = points

