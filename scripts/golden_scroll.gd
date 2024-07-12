extends Area2D

@export var timeline_path: String

var collected: bool = SaveManager.get_saved_scroll()

@onready var mayor_blum: Area2D = %MayorBlum

func _ready():
	if collected:
		mayor_blum.load_timeline("res://dialogic/styles/Default_Style.tres", timeline_path)
		mayor_blum.interacted_with = false
		queue_free()


func _on_body_entered(_body):
	if not collected:
		mayor_blum.load_timeline("res://dialogic/styles/Default_Style.tres", timeline_path)
		mayor_blum.interacted_with = false
		SaveManager.save_scroll(true)
		queue_free()
