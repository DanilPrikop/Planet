extends KinematicBody2D

const G = 674300000000
const MMe = 33
onready var Sun = $"../../Sun"
onready var Ven = $"../../Ven/Ven"
onready var Zem = $"../../Zem/Zem"
var Marpos = Vector2.ZERO
var Merpos = Vector2.ZERO
var Sunpos = Vector2.ZERO
var Venpos = Vector2.ZERO
var Zempos = Vector2.ZERO
var V = Vector2(0,22.798)
var T
var RastMM = Vector2.ZERO
var RastMS = Vector2.ZERO
var RastMV = Vector2.ZERO
var RastMZ = Vector2.ZERO
var a = Vector2.ZERO
onready var co = $"../../cam/Control"

func _ready():
	move_and_slide(V)


func acc(m, r , co):
	var t : float
	t = G * m/pow(r,2) * co
	return t

func _physics_process(delta):
	T = int(co.te)
	Merpos = position * 500000000 / 2
	Sunpos = Sun.position * 500000000 / 2
	Venpos = Ven.position * 500000000 / 2
	Zempos = Zem.position * 500000000 / 2
	RastMS = Sunpos - Merpos
	RastMV = Venpos - Merpos
	RastMZ = Zempos - Merpos
	a.x = acc(Sun.MS,RastMS.length(),cos(RastMS.angle())) + acc(Ven.MV,RastMV.length(),cos(RastMV.angle())) + acc(Zem.MZ,RastMZ.length(),cos(RastMZ.angle()))
	a.y = acc(Sun.MS,RastMS.length(),sin(RastMS.angle())) + acc(Ven.MV,RastMV.length(),sin(RastMV.angle())) + acc(Zem.MZ,RastMZ.length(),sin(RastMZ.angle()))
	V.x = V.x + a.x * T
	V.y = V.y + a.y * T
	move_and_slide(V * T)
	
