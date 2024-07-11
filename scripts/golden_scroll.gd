extends Area2D

@export var timeline_path: String

var collected: bool = false

@onready var mayor_blum: Area2D = %MayorBlum

func _on_body_entered(_body):
	if not collected:
		mayor_blum.load_timeline("res://dialogic/styles/Default_Style.tres", timeline_path)
		mayor_blum.interacted_with = false
		queue_free()
