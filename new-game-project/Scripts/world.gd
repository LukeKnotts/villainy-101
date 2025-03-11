extends Node2D

##Variables
var save_path1 = "res://Save/saveslot1.save"
var save_path2 = "res://Save/saveslot2.save"
var save_path3 = "res://Save/saveslot3.save"
var main_path = "res://Save/mainpath.save"
var saved = false
var save_data = {
	"saveslot": null,
	"pos": Vector2(610,365)
	#to add more values do this:
	#"name of value": base value, <-- make sure to add this comma if theres another line after
	# ex. "level": 0,
	}

func _ready() -> void:
	loadmain()


##Save Functions
func save1():
	var file = FileAccess.open(save_path1, FileAccess.WRITE)
	file.store_var(save_data)
	file.close()
func save2():
	var file = FileAccess.open(save_path2, FileAccess.WRITE)
	file.store_var(save_data)
	file.close()
	
func save3():
	var file = FileAccess.open(save_path3, FileAccess.WRITE)
	file.store_var(save_data)
	file.close()


##Loading Main
func loadmain():
	if FileAccess.file_exists(main_path):
		var save = FileAccess.open(main_path, FileAccess.READ)
		var data = save.get_var() #sets data to the file that was saved
		if data["saveslot"] == "Slot1": #if the save slot we are in is 1 do this
			if FileAccess.file_exists(save_path1):
				var save2 = FileAccess.open(save_path1, FileAccess.READ) #read the save file of that slot
				var data2 = save.get_var()
				save_data = data2
			else: #if it doesnt exist make it with these values
				save_data = {
					"saveslot": "Slot1",
					"pos": Vector2(610,365)
				}
				save1()
		elif data["saveslot"] == "Slot2": #if the save slot we are in is 2 do this
			if FileAccess.file_exists(save_path2):
				var save2 = FileAccess.open(save_path2, FileAccess.READ)
				var data2 = save.get_var()
				save_data = data2
			else: 
				save_data = {
					"saveslot": "Slot2",
					"pos": Vector2(610,365)
				}
				save2()
		elif data["saveslot"] == "Slot3": #if the save slot we are in is 3 do this
			if FileAccess.file_exists(save_path3):
				var save2 = FileAccess.open(save_path3, FileAccess.READ)
				var data2 = save.get_var()
				save_data = data2
			else: 
				save_data = {
					"saveslot": "Slot3",
					"pos": Vector2(610,365)
				}
				save3()
