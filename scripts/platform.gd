extends Path2D

# ==============================================================================
# Variables to handle the platform's movement
@export var tween_duration: float = 1
@onready var follow = $PathFollow2D

# ==============================================================================

func _ready():
# ==============================================================================
# Create a tween to move the platform along the path with the progress ratio

	follow.progress_ratio = 0

	var tween: Tween = create_tween().set_trans(Tween.TRANS_LINEAR)
	tween.tween_property(follow, "progress_ratio", 1, tween_duration)
	tween.tween_property(follow, "progress_ratio", 0, tween_duration)
    # Infinitely loop the tween
	tween.set_loops()
    # Run the tween in the physics process
	tween.set_process_mode(Tween.TWEEN_PROCESS_PHYSICS)

# ==============================================================================
