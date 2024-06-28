extends Area2D

@export var timeline_path: String
@export var style_path: String = "res://dialogic/styles/Default_Style.tres"

var interacted_with: bool = false

@onready var button_sprite: Sprite2D = $ButtonSprite


func _ready():
	var style: DialogicStyle = load(style_path)
	style.prepare()
	Dialogic.preload_timeline(timeline_path)
	button_sprite.visible = false


func _on_body_entered(_body: Node2D):
	if interacted_with:
		return
	button_sprite.visible = true


func _on_body_exited(_body: Node2D):
	button_sprite.visible = false


func _process(_delta):
	if not Input.is_action_just_pressed("interact"):
		return

	if button_sprite.visible:
		Dialogic.start(timeline_path)
		button_sprite.visible = false
		interacted_with = true
