extends Node2D


onready var target_node = 
export var points_per_second : int = 60

var trajectory_line : Line2D
var timer : float = 0.0 # Таймер
var points : Array
var mapoints = 1000

func _ready():
	trajectory_line = Line2D.new()
	add_child(trajectory_line)
	trajectory_line.width = 2 # Ширина линии
	trajectory_line.default_color = Color(1, 0, 0, 0.5) # Цвет линии (красный с прозрачностью)


func _physics_process(delta):
	var pos = target_node.position
	update_trajectory(pos) # Обновляем траекторию


func update_trajectory(a : Vector2):
	if trajectory_line.get_point_count()+1 == mapoints:
		points.remove(0)
	points.append(a)
	trajectory_line.points = points
	
