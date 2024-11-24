extends Node2D
@onready var bomb_sprite = $bomb_sprite
var type: String

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func set_frame(num, key):
	$bomb_sprite.frame = num
	type = key
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
