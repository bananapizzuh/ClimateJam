extends RichTextLabel
var time = 0.0
var secs = 0
var minuets = 0
var hours = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	if not FileAccess.file_exists("user://savetime.save"):
		save_time(hours, minuets, secs)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time += delta
	secs = round_place(time, 2)
	if secs >= 60:
		minuets += 1
		secs -= 60
		time -= 60
	if minuets >= 60:
		hours += 1
		minuets -= 60
	text = add_zero(String.num(hours)) + ":" + add_zero(String.num(minuets)) + ":" + add_zero(String.num(secs)) 

func round_place(num,places):
	return (round(num*pow(10,places))/pow(10,places))

func add_zero(number: String):
	if int(number) < 10:
		return "0" + number
	else:
		return number

func save_time(hours: int, minuets: int, secs: int):
	var new_file = FileAccess.open("user://savetime.save", FileAccess.WRITE)
	new_file.store_line(str(hours) + ',' + str(minuets) + ',' + str(secs))


func get_saved_time():
	var file = FileAccess.open("user://savetime.save", FileAccess.READ)
	return file.get_as_text()
