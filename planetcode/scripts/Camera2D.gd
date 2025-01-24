extends Camera2D

var click = false
var clkpos = Vector2()
var cam = Vector2()
onready var Camera2d = $"."

#func _process(delta):
#	if click:
#		Camera2d.position = (cam+clkpos) - (Camera2d.get_local_mouse_position())

#func _input(event):
#	if event.is_action_pressed("click") == event.button and InputEventMouseButton:
#		if event.is_pressed():
#			cam = Camera2d.position
#			clkpos = Camera2d.get_local_mouse_position()
#			click = true
#		else:
#			click = false
