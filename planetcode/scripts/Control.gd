extends Control


var te = 0
onready var t = get_node("MarginContainer/VBoxContainer/HBoxContainer/Label")

func _on_Incrim_pressed():
	te = t.get_text()
	if int(te) < 5:
		te = str(int(te)+1)
		t.text = str(te)


func _on_Decrim_pressed():
	te = t.get_text()
	if int(te) > 0:
		te = str(int(te)-1)
		t.text = str(te)



func _physics_process(delta):
	t.text = str(te)
