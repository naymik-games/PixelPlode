extends Node2D
class_name Bombstatic

@export var type: String
@export var blast_radius: Area2D
@onready var explosion = preload("res://scenes/explosion_one.tscn")
var is_stopped: bool = false
var is_active: bool = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if is_stopped:
		queue_redraw()
	pass

func explode_bomb():
	if is_active:
		var new_explosion = explosion.instantiate()
		new_explosion.position = position
		get_parent().add_child(new_explosion)
		var pixels = blast_radius.get_overlapping_areas()
		get_tree().call_group("main_game","remove_pixels", pixels)
		queue_free()
func _draw():
	if is_stopped:
		draw_circle($blast_radius/CollisionShape2D.position,$blast_radius/CollisionShape2D.shape.radius, Color.DARK_CYAN, false, 2.0)
