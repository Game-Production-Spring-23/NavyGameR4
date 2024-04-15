extends StaticBody2D

var held = null;

func _process(delta):
	if(held):
		$CollisionShape2D.disabled = true;
	else:
		$CollisionShape2D.disabled = false;
