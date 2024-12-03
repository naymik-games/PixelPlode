extends Node2D
var level_data = Levels.levels[str(SaveData.current_page)+"-"+str(SaveData.current_level)]


@onready var level_image = load(level_data["image"])
#@onready var level_image = preload("res://assets/levels/Group 1/01-003.png")

@onready var pixel = preload("res://scenes/pixel.tscn")
@onready var line = $"../line_layer/aim_line"
@onready var start_ball = $"../line_layer/start_ball"
@onready var ray_cast = $"../line_layer/start_ball/RayCast2D"
@onready var center_container = $"../CanvasLayer/CenterContainer"
@onready var result_label = $"../CanvasLayer/CenterContainer/VBoxContainer/result_label"
@onready var end_percent_label = $"../CanvasLayer/CenterContainer/VBoxContainer/end_percent_label"


const POWER_UP = preload("res://scenes/power_up.tscn")
const TRAIL = preload("res://scenes/trail.tscn")
#var possible_bombs = [
	#preload("res://scenes/bomb_basic.tscn"),
	#preload("res://scenes/bomb_basic.tscn")
#]
var bomb_keys = ["bomb_basic", "bomb_mega","bomb_drop","bomb_split","bomb_tri"]#"bomb_static",

var possible_bombs = {
	"bomb_basic":preload("res://scenes/bomb_basic.tscn"),
	"bomb_mega": preload("res://scenes/bomb_mega.tscn"),
	"bomb_drop": preload("res://scenes/bomb_drop.tscn"),
	"bomb_static": preload("res://scenes/bombstatic.tscn"),
	"bomb_split": preload("res://scenes/bomb_split.tscn"),
	"bomb_tri": preload("res://scenes/bomb_tri.tscn")
}
var available_bombs: Array = []

@onready var state_label = $"../NinePatchRect/HBoxContainer/state_label"
@onready var percent_label = $"../NinePatchRect/HBoxContainer/percent_label"
@onready var level_label = $"../NinePatchRect/HBoxContainer/level_label"
@onready var angle_label = $"../NinePatchRect2/HBoxContainer/angle_label"
@onready var power_label = $"../NinePatchRect2/HBoxContainer/power_label"
@onready var bomb_label = $"../NinePatchRect2/HBoxContainer/bomb_label"
@onready var power_bar = $meter/power_bar
@onready var best_label = $"../NinePatchRect/HBoxContainer/best_label"
@onready var switch_button = $"../switch_button"
@onready var scene_transition = $"../scene_transition/AnimationPlayer"
@onready var color_picker_button = $"../NinePatchRect2/HBoxContainer/ColorPickerButton"
@onready var aim_indicator = $aim_indicator

@onready var background = $"../background"

enum States {
	ROUND,
	LAUNCH,
	RUNNING,
	EXPLODE,
	OVER
}

# This variable keeps track of the character's current state.
var state: States = States.LAUNCH

enum {
	ROUND,
	LAUNCH,
	RUNNING,
	EXPLODE
}

var width: int
var height: int
var board_width: int
var board_height: int
var tile_size: int = 16
var tile_scale: float = 1.0
var x_start: int
var can_shoot: bool = true
var dragging: bool = false
var valid_aim: bool = false
var first_click: Vector2
var launcher_location = Vector2(256,700)
var aim_location = Vector2(256,740)
var reserve_location = Vector2(475,800)
var line_direction: Vector2
var launch_power = 0
var image_grid = []
var total_pixel_count: int = 0
var total_pixel_destroyed: int = 0
var pixel_round_destroyed: int = 0
var ready_to_explode: bool = false
var current_bomb = 0
var reserve = []
var launchable_bomb = null
var main_bomb = null
var tap_count: int
var bomb_factor: int
var pu_factor: int

signal update_stars
# Called when the node enters the scene tree for the first time.
func _ready():
	#SaveData.load_config()
	scene_transition.play("fade_in")
	level_label.text = str(SaveData.current_page + 1) + "-" + str(SaveData.current_level)
	color_picker_button.color = SaveData.bg_color
	background.color = SaveData.bg_color
	set_start_ball()
	aim_indicator.position = launcher_location
	var as_image = level_image.get_image()
	print(as_image.get_size())
	image_grid = get_image_grid(as_image)
	print(total_pixel_count)
	set_factors()
	#print(image_grid)
	draw_image_grid()
	create_reserve()
	position_next_bomb()
	if SaveData.level_data.has(str(SaveData.current_page)+"-"+str(SaveData.current_level)):
		best_label.text = str(SaveData.level_data[str(SaveData.current_page)+"-"+str(SaveData.current_level)].percent) + "%"
	else:
		best_label.text = "--"
	pass # Replace with function body. .get_pixelv(Vector2i(10,10)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#state_label.text = str(state)
	#if Input.is_action_just_pressed("restart"):
		#get_tree().reload_current_scene()
	
	if state == States.LAUNCH and launchable_bomb != null:
		if Input.is_action_just_pressed("launch") and can_shoot:
			first_click = get_global_mouse_position()
			print(first_click)
			if first_click.y > launcher_location.y and first_click.y < 832:
				dragging = true
				print(first_click)
				line.add_point(Vector2(0,0), 0)
				line.add_point(Vector2(0,0), 1)
		if Input.is_action_pressed("launch") and dragging:
			line_direction = get_global_mouse_position() - launcher_location
			line_direction *=-1
			launch_power = launcher_location.distance_to(get_global_mouse_position())
			
			if valid_angle(line_direction, launch_power):
				#angle_label.text = str(line_direction.normalized())
				#clampf((launch_power*.75), 0, 180.0)*8
				var power_temp = clampf((launch_power*.75), 0, 140.0)*8
				#power_label.text = str(roundi(remap(power_temp,0,1120, 0,100.0)))
				
				power_bar.value = roundi(remap(power_temp,0,1120, 0,100.0))
				#power_label.text = str(clampf(launch_power, 0, 180.0)*8)
				#power_label.text = str(clampf((launch_power*.75), 0, 140.0)*8)
				valid_aim = true
				line.set_point_position(0, Vector2(launcher_location.x,launcher_location.y))
				#line.set_point_position(1, line_direction.normalized()*100000)
				ray_cast.target_position = line_direction.normalized()*100000
				#print(ray_cast.target_position)
				line.set_point_position(1, ray_cast.get_collision_point())
			else:
				valid_aim = false
		if Input.is_action_just_released("launch") and can_shoot and valid_aim:
			dragging = false
			valid_aim = false
			launch_bomb()
			line.clear_points()
			
	elif state == States.RUNNING:
		if Input.is_action_just_pressed("launch") and !ready_to_explode:
			if tap_count < main_bomb.taps_allowed:
				if main_bomb.type == "drop":
					launch_static_bomb(main_bomb.position)
				elif main_bomb.type == "split":
					launch_split_bombs(main_bomb.position, main_bomb.linear_velocity)
				tap_count += 1
			
		if !ready_to_explode:
			if check_all_bombs_stopped():
				state = States.EXPLODE
				print("start explode timer")
				$do_explode_timer.start()
				ready_to_explode = true

func check_all_bombs_stopped():
	var bombs = get_tree().get_nodes_in_group("bombs")
	for i in bombs.size():
		if bombs[i].is_active:
			if !bombs[i].is_stopped:
				return false
	return true
		
func valid_angle(line_direction, power):
	#if power > 180:
		#return false
	return true

func set_start_ball():
	start_ball.position = launcher_location

func set_factors():
	if SaveData.difficulty == 0:
		bomb_factor = 1
		pu_factor = -1
	elif SaveData.difficulty == 1:
		bomb_factor = 0
		pu_factor = 0
	else:
		bomb_factor = -1
		pu_factor = 1

func create_reserve():
	make_reserve_bombs()
	for i in available_bombs.size():
		var new_bomb = possible_bombs[available_bombs[i]].instantiate()
		add_child(new_bomb)
		new_bomb.position.x = reserve_location.x
		new_bomb.position.y = reserve_location.y - i * 32
		new_bomb.set_physics_process(false)
		reserve.append(new_bomb)
		pass

func make_reserve_bombs():
	available_bombs.clear()
	var max_b = 6
	if total_pixel_count < 150:
		max_b = 6 + bomb_factor
	elif total_pixel_count > 150 and total_pixel_count < 200:
		max_b = 7 + bomb_factor
	elif total_pixel_count > 200 and total_pixel_count < 250:
		max_b = 8 + bomb_factor
	elif total_pixel_count > 250 and total_pixel_count < 300:
		max_b = 9 + bomb_factor
	elif total_pixel_count > 300 and total_pixel_count < 350:
		max_b = 10 + bomb_factor
	else:
		max_b = 12 + bomb_factor

	for i in max_b:
		var key = bomb_keys[randi_range(0, bomb_keys.size()-1)]
		available_bombs.append(key)
	pass

func launch_bomb():
	launchable_bomb.is_active = true
	launchable_bomb.set_physics_process(true)
	launchable_bomb.add_to_group("bombs")
	#launchable_bomb.launch(line_direction,10)
	#launchable_bomb.launch(line_direction.normalized(),clampf(launch_power, 0, 180.0)*8)
	launchable_bomb.launch(line_direction.normalized(),clampf((launch_power*.75), 0, 180.0)*8)
	var new_trail = TRAIL.instantiate()
	launchable_bomb.add_child(new_trail)
	launchable_bomb.z_index = 1
	new_trail.z_as_relative = false
	new_trail.z_index = 0
	
	#new_trail.position = launchable_bomb.position
	print(launch_power)
	print(roundi(remap(launch_power,0,300, 500,1000.0)))
	print(line_direction.normalized())
	main_bomb = launchable_bomb
	launchable_bomb = null
	$post_launch_timer.start()

func launch_static_bomb(location):
	var new_bomb = possible_bombs["bomb_static"].instantiate()
	add_child(new_bomb)
	new_bomb.position = location
	new_bomb.is_active = true
	new_bomb.is_stopped = true

func launch_split_bombs(location, velocity):
	var deg = -15
	for i in 2:
		
		var new_bomb = possible_bombs["bomb_split"].instantiate()
		add_child(new_bomb)
		new_bomb.position = location
		var angle_offset = deg_to_rad(deg)
		#.rotated(angle_offset)
		#new_bomb.apply_central_impulse(Vector2(-1,-i)*velocity.length())
		new_bomb.apply_central_impulse(velocity.rotated(angle_offset)*1.8)
		new_bomb.is_active = true
		new_bomb.is_stopped = false
		deg += 30

func draw_image_grid():
	for j in height:
		for i in width:
			if image_grid[j][i] != null:
				var new_pixel = pixel.instantiate()
				add_child(new_pixel)
				new_pixel.set_position(Vector2(x_start + i * tile_size, 96 + j * tile_size))
				new_pixel.modulate = image_grid[j][i]
				new_pixel.color = image_grid[j][i]
				new_pixel.grid_location = Vector2i(i,j)
				new_pixel.scale = Vector2(tile_scale, tile_scale)
				image_grid[j][i] = new_pixel

func make_2d_array(height, width):
	var array = []
	for i in height:
		array.append([])
		for j in width:
			array[i].append(null)
	return array


func get_image_grid(image):
	var size:Vector2i = image.get_size()
	width = size.x
	height = size.y
	if width < 33:
		tile_size = 16
		tile_scale = 1.0
		board_width = 32
		board_height = 36
	elif width<43:
		tile_size = 12
		tile_scale = 0.75
		board_width = 42
		board_height = 48
	elif width < 65:
		tile_size = 8
		tile_scale = 0.5
		board_width = 64
		board_height = 70
	else:
		tile_size = 4
		tile_scale = 0.25
		board_width = 128
		board_height = 134
	x_start = ((512 - (size.x *tile_size))/2)
	print(size)
	var image_data = make_2d_array(size.y,size.x)
	for j in size.y:
		for i in size.x:
			var color = image.get_pixel(i,j)
			if color.a > 0:
				image_data[j][i] = color
				total_pixel_count += 1
	print("pixel count: "+ str(total_pixel_count))
	return image_data

func remove_pixels(pixels):
	#print(pixels)
	var temp_count = 0
	for i in pixels.size():
		if pixels[i].is_in_group("pixel_group"):
			var location = pixels[i].grid_location
			if image_grid[location.y][location.x] != null:
				pixels[i].queue_free()
				image_grid[location.y][location.x] = null
				pixel_round_destroyed += 1
		elif pixels[i].is_in_group("pu"):
			var new_bomb = possible_bombs[pixels[i].type].instantiate()
			add_child(new_bomb)
			var j = reserve.size() + temp_count
			new_bomb.position.x = reserve_location.x
			new_bomb.position.y = reserve_location.y - j * 32
			new_bomb.set_physics_process(false)
			reserve.append(new_bomb)
			pixels[i].queue_free()
			temp_count += 1

func explode_bombs():
	var bombs = get_tree().get_nodes_in_group("bombs")
	for i in bombs.size():
		if bombs[i].is_stopped:
			bombs[i].explode_bomb()
	state = States.ROUND
	$end_round_timer.start()
	

func position_next_bomb():
	launchable_bomb = reserve.pop_front()
	var tween = get_tree().create_tween()
	tween.tween_property(launchable_bomb, "position", launcher_location,.5)
	if reserve.size() > 0:
		for i in reserve.size():
			var tween2 = get_tree().create_tween()
			tween2.tween_property(reserve[i], "position:y", reserve_location.y - i * 32,.5)
			bomb_label.text = launchable_bomb.type.to_upper()
			#reserve[i].position.y = reserve_location.y - i * 32
	if randi_range(0,5) > (2 + pu_factor):
		add_pu()

func switch_bombs():
	var temp_bomb = reserve.pop_front()
	var tween = get_tree().create_tween()
	tween.tween_property(launchable_bomb, "position", reserve_location,.5)
	tween.parallel().tween_property(temp_bomb, "position", launcher_location,.5)
	await tween.finished
	print("done")
	reserve.insert(0, launchable_bomb)
	launchable_bomb = temp_bomb
	pass	
func add_pu():
	#new_pixel.set_position(Vector2(x_start + i * tile_size, 96 + j * tile_size))
	var new_pu = POWER_UP.instantiate()
	var ran = randi_range(0,3)
	new_pu.set_frame(ran,bomb_keys[ran])
	var i = randi_range(6, board_width-6)
	var j = randi_range(6, board_height-6)
	new_pu.set_position(Vector2(0 + i * tile_size, 96 + j * tile_size))
	add_child(new_pu)
	pass

func remove_pu():
	if get_tree().get_node_count_in_group("pu") >0:
		var pu = get_tree().get_nodes_in_group("pu")
		for i in pu:
			i.queue_free()

func end_round():
	tap_count = 0
	ready_to_explode = false
	print("end round")
	total_pixel_destroyed += pixel_round_destroyed
	pixel_round_destroyed = 0
	var percent:float = floor((float(total_pixel_destroyed) / total_pixel_count)*100)
	print(total_pixel_destroyed)
	print(total_pixel_count)
	percent_label.text = str(percent)+"%"
	print(str(percent))
	if percent == 100:
		print("Game Over")
		game_over(percent, "Completed!")
		state = States.OVER
	else:
		if reserve.size() == 0:
			if percent >= 90:
				print("Game Over")
				game_over(percent, "Success!")
				state = States.OVER
			else:
				print("Game Over")
				game_over(percent, "Failed!")
				state = States.OVER
		else:
			remove_pu()
			position_next_bomb()
			state = States.LAUNCH

func game_over(percent, text):
	result_label.text = text
	end_percent_label.text = str(percent) + "%"
	var star = get_star_number(percent)
	emit_signal("update_stars",star)
	
	if percent > 89:
		SaveData.level_data[str(SaveData.current_page)+"-"+str(SaveData.current_level)] = {
			"difficulty": SaveData.difficulty,
			"percent": percent,
		}
		### next level
		if !SaveData.level_data.has(str(SaveData.current_page)+"-"+str(SaveData.current_level+1)):
			if SaveData.current_level+1 <= 12:
				SaveData.level_data[str(SaveData.current_page)+"-"+str(SaveData.current_level+1)] = {
					"difficulty": SaveData.difficulty,
					"percent": 0,
					"unlocked": true
				}
				pass
			#unlock neext
			pass
		####
		SaveData.save_data()
	
	var tween = get_tree().create_tween()
	tween.tween_property(center_container,"position:x",0,.5)
func get_star_number(percent):
	if percent < 90:
		return 0
	elif percent < 96:
		return 1
	elif percent < 100:
		return 2
	else:
		return 3
func _on_button_pressed():
	explode_bombs()
	


func _on_do_explode_timer_timeout():
	explode_bombs()


func _on_post_launch_timer_timeout():
	state = States.RUNNING


func _on_end_round_timer_timeout():
	end_round()



#game over buttons
func _on_level_button_pressed():
	get_tree().change_scene_to_file("res://scenes/level_select.tscn")

func _on_replay_button_pressed():
	get_tree().reload_current_scene()

#screen buttons
func _on_replay_small_button_pressed():
	get_tree().reload_current_scene()


func _on_level_small_btton_pressed():
	get_tree().change_scene_to_file("res://scenes/level_select.tscn")


func _on_switch_button_pressed():
	switch_bombs()




func _on_color_picker_button_color_changed(color):
	print(color)
	SaveData.bg_color = color
	SaveData.save_config()
	#background_color = color
	background.color = color
