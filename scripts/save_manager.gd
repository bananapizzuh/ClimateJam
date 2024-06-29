extends Node

# ==============================================================================
# This script is on auto load and is used to save and load the game data
# To use it simply use "SaveManager" in any script
# ==============================================================================

# ==============================================================================
# Essentially a struct to hold the save data

var save = {
	"level_unlocked": 1,
	"time": 0,
}

# ==============================================================================

func read_save() -> Dictionary:
# ==============================================================================
# Read the save file and return the data

    # Check if the save file exists, if not create a new one
	if not FileAccess.file_exists("user://savegame.save"):
		var new_file = FileAccess.open("user://savegame.save", FileAccess.WRITE)
		new_file.store_string(JSON.stringify(save))

	var file = FileAccess.open("user://savegame.save", FileAccess.READ)
	var data = file.get_as_text()
    # Parse the data from the save file
	var recieved = JSON.parse_string(data)

# ==============================================================================

# ==============================================================================
# Check if the data is valid

    # If the data is invalid, print an error message and return the default save data
	if recieved == null or typeof(recieved) != TYPE_DICTIONARY:
		print("Error: Could not parse save file")
		return save

	return recieved
# ==============================================================================

func save_time(time_to_save: float) -> void:
# ==============================================================================
# Save the time to the save file
	var file = FileAccess.open("user://savegame.save", FileAccess.WRITE)
	save["time"] = time_to_save
	file.store_string(JSON.stringify(save))
# ==============================================================================

func get_saved_time() -> float:
# ==============================================================================
# Get the saved time from the save file
	var data = read_save()
	return data["time"]
# ==============================================================================

func save_level(level_unlocked: int) -> void:
# ==============================================================================
# Save the level unlocked to the save file
	var file = FileAccess.open("user://savegame.save", FileAccess.WRITE)
	save["level_unlocked"] = level_unlocked
	file.store_string(JSON.stringify(save))
# ==============================================================================

func get_saved_level() -> int:
# ==============================================================================
# Get the level unlocked from the save file
	var data = read_save()
	return data["level_unlocked"]
# ==============================================================================
