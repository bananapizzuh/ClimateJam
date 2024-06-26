extends Control


func _on_button_pressed():
	SceneManager.change_scene(
		"level_1",
		SceneManager.create_options(0.5),
		SceneManager.create_options(0.5),
		SceneManager.create_general_options()
	)


func _on_button_2_pressed():
	SceneManager.change_scene(
		"level_2",
		SceneManager.create_options(0.5),
		SceneManager.create_options(0.5),
		SceneManager.create_general_options()
	)
