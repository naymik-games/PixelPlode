extends HBoxContainer
#@onready var preview_num_label = $preview_num_label
@onready var preview_image = $preview_image
@onready var level_name_label = $VBoxContainer/level_name_label

signal update_stars
# Called when the node enters the scene tree for the first time.
func _ready():
	update_preview()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func update_preview():
	#preview_num_label.text = str(SaveData.current_level)
	level_name_label.text = Levels.levels[str(SaveData.current_page)+"-"+str(SaveData.current_level)].name
	preview_image.texture = load(Levels.levels[str(SaveData.current_page)+"-"+str(SaveData.current_level)].image)
	var star = 0
	if SaveData.level_data.has(str(SaveData.current_page)+"-"+str(SaveData.current_level)):
		star = get_star_number(SaveData.level_data[str(SaveData.current_page)+"-"+str(SaveData.current_level)].percent)
		
	else:
		star = 0
	emit_signal("update_stars",star)
	
func _on_button_pressed():
	get_tree().change_scene_to_file("res://scenes/game.tscn")

func get_star_number(percent):
	if percent < 90:
		return 0
	elif percent < 96:
		return 1
	elif percent < 100:
		return 2
	else:
		return 3
