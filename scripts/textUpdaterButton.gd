extends Button

func _on_pressed():
	var newText = get_node("/root/GameController").text
	$"../singletonText".text = newText
