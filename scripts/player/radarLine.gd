extends Line2D

var speed = 0
var time = 0
var length = 0

func _ready():
	# Gets length of screen as wave length
	length = get_viewport_rect().size.y

func _process(delta):
	time += delta * speed

	# Clear previous points
	clear_points()

	# Calculate rotation angle based on time
	var rotation_angle = time * speed

	# Calculate the start and end points of the spinning line
	var start_point = Vector2(0, 0)  # Start from the center of the screen
	var end_point = Vector2(length / 2 * cos(rotation_angle), length / 2 * sin(rotation_angle))

	# Add points to draw the spinning line
	add_point(start_point)
	add_point(end_point)

func enableRadar():
	speed = 1
