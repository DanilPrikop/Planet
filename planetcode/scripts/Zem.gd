extends KinematicBody2D


const G = 674300000000
const MZ = 598
onready var Mer = $"../../Mer/Mer"
onready var Ven = $"../../Ven/Ven"
onready var Sun = $"../../Sun"
var Merpos = Vector2.ZERO
var Venpos = Vector2.ZERO
var Sunpos = Vector2.ZERO
var Zempos = Vector2.ZERO
var Marpos = Vector2.ZERO
var V = Vector2(0,11.657)
var Power = Vector2.ZERO
var T
var RastMaZ = Vector2.ZERO
var RastSZ = Vector2.ZERO
var RastVZ = Vector2.ZERO
var RastMeZ = Vector2.ZERO
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
	Zempos = position * 250000000
	Sunpos = Sun.position * 250000000
	Venpos = Ven.position * 250000000
	Merpos = Mer.position * 250000000
	RastSZ = Sunpos - Zempos
	RastMeZ = Merpos - Zempos
	RastVZ = Venpos - Zempos
	a.x = acc(Sun.MS,RastSZ.length(),cos(RastSZ.angle())) + acc(Ven.MV,RastVZ.length(),cos(RastVZ.angle())) + acc(Mer.MMe,RastMeZ.length(),cos(RastMeZ.angle()))
	a.y = acc(Sun.MS,RastSZ.length(),sin(RastSZ.angle())) + acc(Ven.MV,RastVZ.length(),sin(RastVZ.angle())) + acc(Mer.MMe,RastMeZ.length(),sin(RastMeZ.angle()))
	V.x = V.x + a.x * T
	V.y = V.y + a.y * T
	move_and_slide(V * T)
	
