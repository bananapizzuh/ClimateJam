extends CanvasLayer

func _on_level_1_pressed():
# ==============================================================================
# Change the scene to level 1 if the player has pressed the button

	queue_free()
	SceneManager.change_scene(
		"level_1",
		SceneManager.create_options(0.5),
		SceneManager.create_options(0.5),
		SceneManager.create_general_options()
	)

# ==============================================================================

func _on_level_2_pressed():
# ==============================================================================
# Change the scene to level 2 if the player has pressed the button and has unlocked it

	if SaveManager.get_saved_level() >= 2:
		queue_free()
		SceneManager.change_scene(
			"level_2",
			SceneManager.create_options(0.5),
			SceneManager.create_options(0.5),
			SceneManager.create_general_options()
		)

# ==============================================================================

func _on_level_3_pressed():
# ==============================================================================
# Change the scene to level 3 if the player has pressed the button and has unlocked it

	if SaveManager.get_saved_level() >= 3:
		queue_free()
		SceneManager.change_scene(
			"level_3",
			SceneManager.create_options(0.5),
			SceneManager.create_options(0.5),
			SceneManager.create_general_options()
		)

# ==============================================================================
