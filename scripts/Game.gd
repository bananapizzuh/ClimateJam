extends Node2D

@onready var leval_instence
@onready var leval_load
# Called when the node enters the scene tree for the first time.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func load_leval(location: String):
	print("res://Levals/" + location + ".tscn")
	leval_load = load("res://Levals/" + location + ".tscn")
	leval_instence = leval_load.instantiate()
	add_child(leval_instence)
	print_tree()
	var killzone = leval_instence.get_node("Killzone")
	killzone.player_death.connect(_on_player_death)
	print(leval_instence)


func _on_button_pressed():
	load_leval("leval_1")


func _on_button_2_pressed():
	print("pressed")
	load_leval("leval_2")


func _on_player_death():
	print("death recived")
	leval_instence.queue_free()
	leval_instence = leval_load.instantiate()
	add_child(leval_instence)
	var killzone = leval_instence.get_node("Killzone")
	killzone.player_death.connect(_on_player_death)
