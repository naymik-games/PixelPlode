extends TextureRect
var textures =[
	preload("res://assets/stars0.png"),
	preload("res://assets/stars1.png"),
	preload("res://assets/stars2.png"),
	preload("res://assets/stars3.png")
]

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_grid_update_stars(amount):
	texture = textures[amount]
	pass # Replace with function body.


func _on_level_update_stars(amount):
	texture = textures[amount]
	pass # Replace with function body.
