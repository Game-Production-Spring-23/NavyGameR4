extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

func _physics_process(delta):
	var xdirection = Input.get_axis("left", "right")
	var ydirection = Input.get_axis("up", "down")
	if xdirection or ydirection:
		velocity.x = xdirection * SPEED
		velocity.y = ydirection * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()
	
	if(position.x > 1200):
		pass
