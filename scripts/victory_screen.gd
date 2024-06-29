extends CanvasLayer

func _ready():
# ==============================================================================
# Load the saved time and display it on the screen

	$RichTextLabel.text = "[center]It took you " + \
	Time.get_time_string_from_unix_time(int(SaveManager.get_saved_time())) + \
	" to win![/center]"

# ==============================================================================

func _on_return_button_pressed():
# ==============================================================================
# Change the scene to the main menu on the button press

	queue_free()
	SceneManager.change_scene(
		"menu",
		SceneManager.create_options(0.5),
		SceneManager.create_options(0.5),
		SceneManager.create_general_options()
	)

# ==============================================================================
