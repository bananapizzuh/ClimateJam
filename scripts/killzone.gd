extends Area2D


func _on_body_entered(_body):
	SceneManager.change_scene(
		SceneManager._current_scene,
		SceneManager.create_options(0.1),
		SceneManager.create_options(0.1),
		SceneManager.create_general_options()
	)
