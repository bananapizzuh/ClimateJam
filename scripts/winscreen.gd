extends RichTextLabel

var secs = 0
var minutes = 0
var hours = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	var times = get_saved_time()
	var saved_times = times.split(",")
	secs = int(saved_times[2])
	minutes = int(saved_times[1])
	hours = int(saved_times[0])
	text = add_zero(String.num(hours)) + ":" + add_zero(String.num(minutes)) + ":" + add_zero(String.num(secs))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
func round_place(num,places):
	return (round(num*pow(10,places))/pow(10,places))

func add_zero(number: String):
	if int(number) < 10:
		return "0" + number
	else:
		return number

func get_saved_time():
	var file = FileAccess.open("user://savetime.save", FileAccess.READ)
	return file.get_as_text()
