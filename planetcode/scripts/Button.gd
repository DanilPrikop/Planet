extends Button


func _on_Button2_pressed():
	var te = $"../Label".text
	te = str(int(te)-1)
	if int(te) >= 0:
		$"../Label".text = te
