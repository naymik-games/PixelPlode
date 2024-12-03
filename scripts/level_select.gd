extends Node
var page: int
var drawing: int
var levels_per_page: int = 12
var level_count: int = 1
const LEVEL = preload("res://scenes/level.tscn")
@onready var grid_container = $MarginContainer/GridContainer
var next_page_key: String
var prev_page_key: String
@onready var prev_button = $HBoxContainer2/prev_button
@onready var next_button = $HBoxContainer2/next_button
@onready var page_title = $HBoxContainer/page_title
@onready var scene_transition = $scene_transition/AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	scene_transition.play("fade_in")
	SaveData.load_data()
	print(SaveData.level_data)
	page = SaveData.current_page
	drawing= SaveData.current_level
	page_title.text = "PAGE " + str(page + 1)
	add_levels()
	update_buttons()


func update_buttons():
	next_page_key = str(SaveData.current_page + 1)+"-" + "1"
	prev_page_key = str(SaveData.current_page -1)+"-" + "1"
	next_button.disabled = true
	prev_button.disabled = true
	if Levels.levels.has(prev_page_key):
		prev_button.disabled = false
	if Levels.levels.has(next_page_key):
		next_button.disabled = false

func add_levels():
	level_count = 1
	get_tree().call_group("preview","update_preview")
	for i in levels_per_page:
		var new_level = LEVEL.instantiate()
		grid_container.add_child(new_level)
		new_level.level_page = SaveData.current_page
		new_level.level_number = level_count
		
		if SaveData.level_data.has(str(SaveData.current_page)+"-"+str(level_count)):
			print("exists")
			new_level.unlocked = true
		else: 
			if level_count == 1:
				new_level.unlocked = true
				SaveData.level_data[str(SaveData.current_page)+"-"+str(level_count)] = {
					"difficulty": SaveData.difficulty,
					"percent": 0,
					"unlocked": true
				}
				SaveData.save_data()
				
			print("does not exist")
		new_level.update_level()
		level_count += 1
		pass

func clear_levels():
	for i in grid_container.get_children():
		grid_container.remove_child(i)
		i.queue_free()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_prev_button_pressed():
	SaveData.current_page -= 1
	SaveData.current_level = 1
	page_title.text = "PAGE " + str(SaveData.current_page+ 1)
	clear_levels()
	add_levels()
	update_buttons()

func get_star_number(percent):
	if percent < 90:
		return 0
	elif percent < 96:
		return 1
	elif percent < 100:
		return 2
	else:
		return 3

func _on_next_button_pressed():
	SaveData.current_page += 1
	SaveData.current_level = 1
	page_title.text = "PAGE " + str(SaveData.current_page+ 1)
	clear_levels()
	add_levels()
	update_buttons()


func _on__pressed():
	scene_transition.play("fade_out")
	await get_tree().create_timer(.5).timeout
	get_tree().change_scene_to_file("res://scenes/home.tscn")
