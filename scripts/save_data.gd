extends Node
var current_level: int = 8
var current_page: int = 0
var difficulty: int = 2
var bg_color: Color = "04373b"

const FILE_NAME = "user://pixel_plode-data.save"
const CONFIG_NAME = "user://pixel_plode-config.cfg"
var level_data = {}

var default_data = {
	"0-1": {
	"difficulty": 1,
	"percent": 0,
	"unlocked": true
	}
}

func save_data():
	var save_file = FileAccess.open(FILE_NAME, FileAccess.WRITE)
	save_file.store_var(level_data)
	save_file.store_var(current_level)
	save_file.store_var(current_page)
	save_file.close()

func load_data():
	if FileAccess.file_exists(FILE_NAME):
		var save_file = FileAccess.open(FILE_NAME, FileAccess.READ)
		level_data = save_file.get_var()
		current_level = save_file.get_var()
		current_page = save_file.get_var()
		save_file.close()
		print(level_data)
	else:
		print("no saved file...")
		level_data = default_data
		current_level = 1
		current_page = 0
		

func reset_data():
	var save_file = FileAccess.open(FILE_NAME, FileAccess.WRITE)
	level_data = default_data
	current_level = 1
	current_page = 0
	save_file.store_var(level_data)
	save_file.store_var(current_level)
	save_file.store_var(current_page)
	save_file.close()

func save_config():
	var config = ConfigFile.new()
	# Store some values.
	config.set_value("Game", "difficulty", difficulty)
	config.set_value("Game", "bg_color", bg_color)
	# Save it to a file (overwrite if already exists).
	config.save(CONFIG_NAME)
	
func load_config():
	var config = ConfigFile.new()
	# Load data from a file.
	var err = config.load(CONFIG_NAME)
	# If the file didn't load, ignore it.
	if err != OK:
		difficulty = 1
		bg_color = "04373b"
		return

	difficulty = config.get_value("Game", "difficulty")
	bg_color = config.get_value("Game", "bg_color")


		
	
