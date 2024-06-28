extends CanvasLayer


func _ready():
	if not FileAccess.file_exists("user://savegame.save"):
		save_game(1)


func save_game(level_unlocked: int):
	var new_file = FileAccess.open("user://savegame.save", FileAccess.WRITE)
	new_file.store_line(str(level_unlocked))


func get_saved_game():
	var file = FileAccess.open("user://savegame.save", FileAccess.READ)
	return int(file.get_as_text())


func _on_level_1_pressed():
	queue_free()
	SceneManager.change_scene(
		"level_1",
		SceneManager.create_options(0.5),
		SceneManager.create_options(0.5),
		SceneManager.create_general_options()
	)


func _on_level_2_pressed():
	if get_saved_game() >= 2:
		queue_free()
		SceneManager.change_scene(
			"level_2",
			SceneManager.create_options(0.5),
			SceneManager.create_options(0.5),
			SceneManager.create_general_options()
		)


func _on_level_3_pressed():
	if get_saved_game() >= 3:
		queue_free()
		SceneManager.change_scene(
			"level_3",
			SceneManager.create_options(0.5),
			SceneManager.create_options(0.5),
			SceneManager.create_general_options()
		)
