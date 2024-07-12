extends Area2D

func _on_body_entered(_body):
# ==============================================================================
# Change the scene to the main menu and increment the saved level if the player has won
	if SaveManager.get_saved_scroll() or SceneManager._current_scene != "level_1":
		if int(SceneManager._current_scene) <= SaveManager.get_saved_level():
			SaveManager.save_level(int(SceneManager._current_scene) + 1)

		get_parent().queue_free()
		if SaveManager.get_saved_level() >= 3&&int(SceneManager._current_scene) == 3:
			SceneManager.change_scene(
				"victory_screen",
				SceneManager.create_options(0.5),
				SceneManager.create_options(0.5),
				SceneManager.create_general_options()
			)
		else:
			SceneManager.change_scene(
				"level_" + str(SaveManager.get_saved_level()),
				SceneManager.create_options(0.5),
				SceneManager.create_options(0.5),
				SceneManager.create_general_options()
			)
# ==============================================================================
