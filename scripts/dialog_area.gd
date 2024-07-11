extends Area2D

# ==============================================================================
# Variables to get the timeline and style for preloading (no lag)

@export var timeline_path: String
@export var style_path: String = "res://dialogic/styles/Default_Style.tres"

# ==============================================================================

# ==============================================================================
# In case the player interacts with the dialog area more than once

var interacted_with: bool = false

# ==============================================================================

# ==============================================================================
# Get the button sprite to show when the player can interact with the dialog area

@onready var button_sprite: Sprite2D = $ButtonSprite

# ==============================================================================

func _ready():
	load_timeline(style_path, timeline_path)

func load_timeline(new_style_path: String, new_timeline_path: String):
# ==============================================================================
# Preload the timeline and style to avoid lag and hide button on start

	var style: DialogicStyle = load(new_style_path)
	style.prepare()
	Dialogic.preload_timeline(new_timeline_path)

	timeline_path = new_timeline_path

	button_sprite.hide()

# ==============================================================================

func _on_body_entered(_body: Node2D):
# ==============================================================================
# Show the button sprite when the player enters the dialog area
# But only if the player hasn't interacted with it yet

	if interacted_with:
		return
	button_sprite.show()

# ==============================================================================

func _on_body_exited(_body: Node2D):
# ==============================================================================
# Hide the button sprite when the player exits the dialog area

	button_sprite.hide()

# ==============================================================================

func _process(_delta):
# ==============================================================================
# Skip the interaction if the player hasn't pressed the interact button
	if not Input.is_action_just_pressed("interact"):
		return

	# If the button sprite is visible, start the dialogic timeline and hide the button
	if button_sprite.visible:
		Dialogic.start(timeline_path)
		button_sprite.hide()
		interacted_with = true

# ==============================================================================
