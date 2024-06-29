extends Area2D


func _on_body_entered(_body):
	if int(SceneManager._current_scene) <= get_saved_game():
		save_game(int(SceneManager._current_scene) + 1)

	get_parent().queue_free()
	if get_saved_game() >= 3 && int(SceneManager._current_scene) == 3:
		SceneManager.change_scene(
			"win",
			SceneManager.create_options(0.5),
			SceneManager.create_options(0.5),
			SceneManager.create_general_options()
		)
	else:
		SceneManager.change_scene(
			"menu",
			SceneManager.create_options(0.5),
			SceneManager.create_options(0.5),
			SceneManager.create_general_options()
		)


func save_game(level_unlocked: int):
	var new_file = FileAccess.open("user://savegame.save", FileAccess.WRITE)
	print(str(level_unlocked))
	new_file.store_line(str(level_unlocked))


func get_saved_game():
	var file = FileAccess.open("user://savegame.save", FileAccess.READ)
	return int(file.get_as_text())
