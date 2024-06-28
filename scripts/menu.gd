extends CanvasLayer


func _ready():
	if not FileAccess.file_exists("user://savegame.save"):
		save_game(1)
	print(get_saved_game())


func _on_button_pressed():
	queue_free()
	SceneManager.change_scene(
		"level_1",
		SceneManager.create_options(0.5),
		SceneManager.create_options(0.5),
		SceneManager.create_general_options()
	)
	save_game(2)


func _on_button_2_pressed():
	if get_saved_game() >= 2:
		SceneManager.change_scene(
			"level_2",
			SceneManager.create_options(0.5),
			SceneManager.create_options(0.5),
			SceneManager.create_general_options()
		)


func _on_button_4_pressed():
	if get_saved_game() >= 3:
		SceneManager.change_scene(
			"level_3",
			SceneManager.create_options(0.5),
			SceneManager.create_options(0.5),
			SceneManager.create_general_options()
		)


func save_game(leval_unlocked: int):
	var new_file = FileAccess.open("user://savegame.save", FileAccess.WRITE)
	print(str(leval_unlocked))
	new_file.store_line(str(leval_unlocked))


func get_saved_game():
	var file = FileAccess.open("user://savegame.save", FileAccess.READ)
	return int(file.get_as_text())
