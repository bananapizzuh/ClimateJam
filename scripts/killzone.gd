extends Area2D


func _on_body_entered(_body):
	print("death")
	SceneManager.change_scene(
		SceneManager._current_scene,
		SceneManager.create_options(0.1),
		SceneManager.create_options(0.3),
		SceneManager.create_general_options()
	)
