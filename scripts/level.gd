extends Button
var level_page: int
var level_number: int
var unlocked: bool = false
@onready var level_num_label = $MarginContainer/CenterContainer/VBoxContainer/level_num_label
@onready var stars = $MarginContainer/CenterContainer/VBoxContainer/stars
@onready var margin_container = $MarginContainer
@onready var texture_rect = $MarginContainer/TextureRect
@onready var lock_icon = $MarginContainer/lock_icon
signal update_stars


# Called when the node enters the scene tree for the first time.
func _ready():
	texture_rect.hide()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func update_level():
	level_num_label.text = str(level_number)
	if SaveData.level_data.has(str(level_page)+str(level_number)):
		var star = get_star_number(SaveData.level_data[str(level_page)+str(level_number)].percent)
		lock_icon.hide()
		emit_signal("update_stars",star)
		if unlocked:
			lock_icon.hide
	
	pass

func unselect():
	texture_rect.hide()

func get_star_number(percent):
	if percent < 90:
		return 0
	elif percent < 96:
		return 1
	elif percent < 100:
		return 2
	else:
		return 3

func _on_pressed():
	if unlocked:
		get_tree().call_group("level_group", "unselect")
		SaveData.current_level = level_number
		SaveData.current_page = level_page
		get_tree().call_group("preview","update_preview")
		texture_rect.show()
		pass # Replace with function body.
