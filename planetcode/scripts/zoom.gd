class_name ZoomingCam
extends Camera2D

onready var sc = $"../Control"
export var min_zoom := 0.5
export var max_zoom := 2.0
export var zoom_factor := 0.1
export var zoom_duration := 0.1
export var min_scale := 0.5
export var max_scale := 0.5
export var t := 0
export var max_t := 20
export var min_t := -9

var _zoom_level := 1.0 setget _set_zoom_level

onready var tween: Tween = $Tween

func _set_zoom_level(value: float) -> void:
	# We limit the value between `min_zoom` and `max_zoom`
	_zoom_level = clamp(value, min_zoom, max_zoom)
	# Then, we ask the tween node to animate the camera's `zoom` property from its current value
	# to the target zoom level.
	tween.interpolate_property(
		self,
		"zoom",
		zoom,
		Vector2(_zoom_level, _zoom_level),
		zoom_duration,
		tween.TRANS_SINE,
		# Easing out means we start fast and slow down as we reach the target value.
		tween.EASE_OUT
	)
	tween.start()
	
func _set_posandsc():
	pass
	
func _unhandled_input(event):
	if event.is_action_pressed("zoom_in"):
		# Inside a given class, we need to either write `self._zoom_level = ...` or explicitly
		# call the setter function to use it.
		_set_zoom_level(_zoom_level - zoom_factor)
		if min_t < t and t <= max_t:
			t = t-1
			sc.rect_position.x += 36
			sc.rect_position.y += 24
			sc.rect_scale.x -= 0.1
			sc.rect_scale.y -= 0.1
	if event.is_action_pressed("zoom_out"):
		_set_zoom_level(_zoom_level + zoom_factor)
		if min_t <= t and t < max_t:
			t = t+1
			sc.rect_position.x -= 36
			sc.rect_position.y -= 24
			sc.rect_scale.x += 0.1
			sc.rect_scale.y += 0.1
