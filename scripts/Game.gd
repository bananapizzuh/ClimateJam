extends Node2D

var leval_instence

# Called when the node enters the scene tree for the first time.
func _ready():
	load_leval("leval_1")

func unlode_leval():
	if (is_instance_valid(leval_instence)):
		leval_instence.queue_free()
	leval_instence = null

func load_leval(name : String):
	unlode_leval()
	var path := "res://Levals/%s.tscn" % name
	var loaded_path := load(path)
	if (loaded_path):
		leval_instence = loaded_path.instantiate()
		add_child(leval_instence)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
