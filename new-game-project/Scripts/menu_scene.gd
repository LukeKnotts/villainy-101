extends Node2D

##Variables
var World = preload("res://Scenes/world.tscn").instantiate()    
var save_path1 = "res://Save/saveslot1.save"
var save_path2 = "res://Save/saveslot2.save"
var save_path3 = "res://Save/saveslot3.save"
var main_path = "res://Save/mainpath.save"
var save_data = {
	"saveslot": null,
	"pos": Vector2(0,0)
	#to add more values do this:
	#"name of value": base value, <-- make sure to add this comma if theres another line after
	# ex. "level": 0,
}

##Load Functions
func load1():
	save_data["saveslot"] = "Slot1"
	var file = FileAccess.open(main_path, FileAccess.WRITE) #opens up the save file to write the name of the saveslot
	file.store_var(save_data)
	file.close()
		
func load2():
	save_data["saveslot"] = "Slot2"
	var file = FileAccess.open(main_path, FileAccess.WRITE)
	file.store_var(save_data)
	file.close()

func load3():
	save_data["saveslot"] = "Slot3"
	var file = FileAccess.open(main_path, FileAccess.WRITE)
	file.store_var(save_data)
	file.close()
