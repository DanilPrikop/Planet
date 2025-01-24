extends KinematicBody2D

const G = 674301515151
var MS = 198850000
var Sunpos = Vector2.ZERO
onready var Mer = $"../Mer/Mer"
onready var Ven = $"../Ven/Ven"
onready var Zem = $"../Zem/Zem"
var Marpos = Vector2.ZERO
var Merpos = Vector2.ZERO
var Venpos = Vector2.ZERO
var Zempos = Vector2.ZERO
var V = Vector2.ZERO
var T
var RastSMe = Vector2.ZERO
var RastSMa = Vector2.ZERO
var RastSV = Vector2.ZERO
var RastSZ = Vector2.ZERO
var a = Vector2.ZERO
onready var co = $"../cam/Control"

func acc(m, r , co):
	var t : float
	t = G * m/pow(r,2) * co
	return t

func _physics_process(delta):
	T = int(co.te)
	Sunpos = position * 250000000
	Merpos = Mer.position * 250000000
	Venpos = Ven.position * 250000000
	Zempos = Zem.position * 250000000
	RastSMe = Sunpos - Merpos
	RastSV = Sunpos - Venpos
	RastSZ = Sunpos - Zempos
	a.x = acc(Ven.MV,RastSV.length(),cos(RastSV.angle())) 
	+ acc(Mer.MMe,RastSMe.length(),cos(RastSMe.angle())) 
	+ acc(Zem.MZ,RastSZ.length(),cos(RastSZ.angle()))
	a.y = acc(Ven.MV,RastSV.length(),sin(RastSV.angle())) 
	+ acc(Mer.MMe,RastSMe.length(),sin(RastSMe.angle())) 
	+ acc(Zem.MZ,RastSZ.length(),cos(RastSZ.angle()))
	V.x = V.x + a.x * T
	V.y = V.y + a.y * T
	move_and_slide(V * T)
