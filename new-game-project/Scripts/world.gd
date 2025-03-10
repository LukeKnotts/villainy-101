extends Node2D

##Variables
var save_path1 = "user://saveslot1.save"
var save_path2 = "user://saveslot2.save"
var save_path3 = "user://saveslot3.save"
var main_path = "user://mainpath.save"
var saved = false
var saveslot = "Save1"


func _ready() -> void:
	loadmain()

##Save Functions
func save1():
	var file = FileAccess.open(save_path1, FileAccess.WRITE)
	file.store_var(saved)
	print(saved)

func save2():
	var file = FileAccess.open(save_path2, FileAccess.WRITE)
	file.store_var(saved)
	
func save3():
	var file = FileAccess.open(save_path3, FileAccess.WRITE)
	file.store_var(saved)

##Load Functions
func load1():
	if FileAccess.file_exists(save_path1):
		var file = FileAccess.open(save_path1, FileAccess.READ)
		saved = file.get_var(saved)
		print(saved)
	else: 
		saved = false

func load2():
	if FileAccess.file_exists(save_path1):
		var file = FileAccess.open(save_path2, FileAccess.READ)
		saved = file.get_var(saved)

func load3():
	if FileAccess.file_exists(save_path1):
		var file = FileAccess.open(save_path1, FileAccess.READ)
		saved = file.get_var(saved)

func loadmain():
	if FileAccess.file_exists(main_path):
		var file = FileAccess.open(main_path, FileAccess.READ)
		saveslot = file.get_var(saveslot)
