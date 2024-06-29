extends RichTextLabel
var time = 0.0
var secs = 0
var minutes = 0
var hours = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	if not FileAccess.file_exists("user://savetime.save"):
		save_time(hours, minutes, secs)
	else:
		var times = get_saved_time()
		var saved_times = times.split(",")
		time = int(saved_times[2])
		minutes = int(saved_times[1])
		hours = int(saved_times[0])



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time += delta
	secs = round_place(time, 2)
	if secs >= 60:
		minutes += 1
		secs -= 60
		time -= 60
	if minutes >= 60:
		hours += 1
		minutes -= 60
	text = add_zero(String.num(hours)) + ":" + add_zero(String.num(minutes)) + ":" + add_zero(String.num(secs)) 
	save_time(hours, minutes, secs)

func round_place(num,places):
	return (round(num*pow(10,places))/pow(10,places))

func add_zero(number: String):
	if int(number) < 10:
		return "0" + number
	else:
		return number

func save_time(hours: int, minutes: int, secs: int):
	var new_file = FileAccess.open("user://savetime.save", FileAccess.WRITE)
	new_file.store_line(str(hours) + ',' + str(minutes) + ',' + str(secs))


func get_saved_time():
	var file = FileAccess.open("user://savetime.save", FileAccess.READ)
	return file.get_as_text()
