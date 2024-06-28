extends Area2D



func _on_body_entered(_body):
	print("emterted")
	SceneManager.change_scene(
		"menu",
		SceneManager.create_options(0.5),
		SceneManager.create_options(0.5),
		SceneManager.create_general_options()
	)
	if int(SceneManager._current_scene) <= get_saved_game():
		save_game(int(SceneManager._current_scene) + 1)

func save_game(leval_unlocked : int):
	var new_file = FileAccess.open("user://savegame.save", FileAccess.WRITE)
	print(str(leval_unlocked))
	new_file.store_line(str(leval_unlocked))

func get_saved_game():
	var file = FileAccess.open("user://savegame.save", FileAccess.READ)
	return int(file.get_as_text())
