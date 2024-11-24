extends Node
@onready var option_button = $VBoxContainer/HBoxContainer/OptionButton
@onready var color_picker_button = $VBoxContainer/HBoxContainer2/ColorPickerButton
@onready var reset_button = $VBoxContainer/HBoxContainer3/reset_button



# Called when the node enters the scene tree for the first time.
func _ready():
	SaveData.load_config()
	option_button.select(SaveData.difficulty)
	color_picker_button.color = SaveData.bg_color

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	SaveData.difficulty = option_button.selected
	SaveData.save_config()
	get_tree().change_scene_to_file("res://scenes/level_select.tscn")


func _on_reset_button_pressed():
	reset_button.hide()
	SaveData.reset_data()
