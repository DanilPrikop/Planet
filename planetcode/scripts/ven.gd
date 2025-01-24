extends KinematicBody2D


const G = 674300000000
var MV = 490
onready var Mer = $"../../Mer/Mer"
onready var Sun = $"../../Sun"
onready var Zem = $"../../Zem/Zem"
var Merpos = Vector2.ZERO
var Sunpos = Vector2.ZERO
var Zempos = Vector2.ZERO
var Marpos = Vector2.ZERO
var Rast = Vector2.ZERO
var Venpos = Vector2.ZERO
var a = Vector2.ZERO
var V = Vector2(0,13.6252)
var T
var RastMaV = Vector2.ZERO
var RastSV = Vector2.ZERO
var RastMeV = Vector2.ZERO
var RastZV = Vector2.ZERO
onready var co = $"../../cam/Control"

func acc(m, r , co):
	var t : float
	t = G * m/pow(r,2) * co
	return t

func _ready():
	move_and_slide(V)

func _physics_process(delta):
	T = int(co.te)
	Venpos = position * 500000000 / 2
	Sunpos = Sun.position * 500000000 / 2
	Merpos = Mer.position * 500000000 / 2
	Zempos = Zem.position * 500000000 / 2
	RastSV = Sunpos - Venpos
	RastMeV = Merpos - Venpos
	RastZV = Zempos - Venpos
	a.x = acc(Sun.MS,RastSV.length(),cos(RastSV.angle())) + acc(Mer.MMe,RastMeV.length(),cos(RastMeV.angle())) + acc(Zem.MZ,RastZV.length(),cos(RastZV.angle()))
	a.y = acc(Sun.MS,RastSV.length(),sin(RastSV.angle())) + acc(Mer.MMe,RastMeV.length(),sin(RastMeV.angle())) + acc(Zem.MZ,RastZV.length(),sin(RastZV.angle()))
	V.x = V.x + a.x * T
	V.y = V.y + a.y * T
	#print(RastSV.length() / 500000000 / 2)
	move_and_slide(V * T)
	#print(a)
