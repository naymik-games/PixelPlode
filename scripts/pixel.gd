extends Area2D

var color: Color
var grid_location: Vector2i

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_body_entered(body):
	if body.type != "drop":
		body.set_linear_velocity(Vector2(0,0))
		pass
	#body.show_radius()
	
	#body.stopped()
	#print(body.position)
	pass # Replace with function body.
