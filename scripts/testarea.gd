extends Area2D

@onready var button_sprite: Sprite2D = $ButtonSprite


func _ready():
	button_sprite.visible = false


func _on_body_entered(_body: Node2D):
	button_sprite.visible = true


func _on_body_exited(_body: Node2D):
	button_sprite.visible = false


func _process(_delta):
	if not Input.is_action_just_pressed("interact"):
		return

	if button_sprite.visible:
		print("Button pressed")
