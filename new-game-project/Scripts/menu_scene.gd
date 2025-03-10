extends Node2D

##Variables
var World = preload("res://Scenes/world.tscn").instantiate()    
var save_path1 = "user://saveslot1.save"
var save_path2 = "user://saveslot2.save"
var save_path3 = "user://saveslot3.save"
var main_path = "user://mainpath.save"
var saveslot = null

##Load Functions
func load1():
	saveslot = "Slot1"
	var file = FileAccess.open(main_path, FileAccess.WRITE)
	file.store_var(saveslot)
	print(saveslot)
		
func load2():
	saveslot = "Slot2"
	var file = FileAccess.open(main_path, FileAccess.WRITE)
	file.store_var(saveslot)

func load3():
	saveslot = "Slot3"
	var file = FileAccess.open(main_path, FileAccess.WRITE)
	file.store_var(saveslot)
