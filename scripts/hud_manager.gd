extends CanvasLayer

# ==============================================================================
# Variables to handle the speedrun timer
var time: float = 0
var loaded_time: float = 0
var start_time: float = 0
var frames_passed: int = 0

# ==============================================================================

# ==============================================================================
# Get the timer text label
@onready var timer_label: RichTextLabel = $ColorRect/Timer
# ==============================================================================

func _ready() -> void:
# ==============================================================================
# Generate the start in the save file if there isn't a save file load the saved time

	start_time = Time.get_unix_time_from_system()
	loaded_time = SaveManager.get_saved_time()

# ==============================================================================

func _process(_delta) -> void:
# ==============================================================================
# Update the timer every frame
	time = (Time.get_unix_time_from_system() - start_time) + loaded_time
	timer_label.text = Time.get_time_string_from_unix_time(int(time))

	frames_passed += 1

	if frames_passed >= 30:
		frames_passed = 0
		print("Saving time", Engine.get_frames_per_second())
		SaveManager.save_time(time)

# ==============================================================================
