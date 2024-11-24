extends RigidBody2D
class_name  Bomb

@export var type: String
@export var blast_radius: Area2D
@export var layer: CanvasLayer
@export var taps_allowed: int = 0
@onready var explosion = preload("res://scenes/explosion_one.tscn")

var is_stopped: bool = false
var is_active: bool = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func launch(shoot_direction,speed):
	apply_central_impulse(shoot_direction*speed)
func show_radius():
	layer.draw_circle(position, 48, Color.RED,false, 5.0)
	
func explode_bomb():
	if is_active:
		var new_explosion = explosion.instantiate()
		new_explosion.position = position
		get_parent().add_child(new_explosion)
		var pixels = blast_radius.get_overlapping_areas()
		get_tree().call_group("main_game","remove_pixels", pixels)
		queue_free()

func _process(delta):
	if is_stopped:
		queue_redraw()

func _integrate_forces(state):
	#if state.linear_velocity == Vector2.ZERO:
		#is_stopped = true
	if !is_stopped and is_active:
		if state.linear_velocity.length() < 5:
			state.linear_velocity = Vector2.ZERO
			is_stopped = true
			state.angular_velocity = 0
			print("stopped")
func _draw():
	if is_stopped:
		draw_circle($blast_radius/CollisionShape2D.position,$blast_radius/CollisionShape2D.shape.radius, Color.DARK_CYAN, false, 2.0)
	#position: Vector2, radius: float, color: Color, filled: bool = true, width: float = -1.0, antialiased: bool = false
