extends Path2D

@export var tween_duration: float = 1

@onready var follow = $PathFollow2D


func _ready():
	follow.progress_ratio = 0

	var tween: Tween = create_tween().set_trans(Tween.TRANS_LINEAR)
	tween.tween_property(follow, "progress_ratio", 1, tween_duration)
	tween.tween_property(follow, "progress_ratio", 0, tween_duration)
	tween.set_loops()
	tween.set_process_mode(Tween.TWEEN_PROCESS_PHYSICS)
