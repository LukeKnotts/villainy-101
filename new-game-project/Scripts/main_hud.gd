extends CanvasLayer
var file = null
##IM SORRY FOR THIS CODE IT WAS 10 AT NIGHT AND IM TIRED -from Alex
func _ready() -> void:
	var World = load("res://Scenes/world.tscn").instantiate()
	var save = FileAccess.open(World.main_path, FileAccess.READ)
	var data = save.get_var()
	
	if data["saveslot"] == "Slot1": ##if slot is saveslot1 then do this
		if FileAccess.file_exists(World.save_path1):
			var save2 = FileAccess.open(World.save_path1, FileAccess.READ)
			var data2 = save2.get_var() #the data from saveslot 1
			print(save2)
			$Quit/Label.text = str(data2["pos"]) #makes the lable show the position
			var Player = load("res://Scenes/player.tscn").instantiate() #loads the player scene
			Player.position = data2["pos"] #sets players position to pos
			add_child(Player) #adds player to scene
			
	elif data["saveslot"] == "Slot2":
		if FileAccess.file_exists(World.save_path2):
			var save2 = FileAccess.open(World.save_path2, FileAccess.READ)
			var data2 = save2.get_var()
			print(save2)
			$Quit/Label.text = str(data2["pos"])
			var Player = load("res://Scenes/player.tscn").instantiate()  
			Player.position = data2["pos"]
			add_child(Player)
			
	elif data["saveslot"] == "Slot3":
		if FileAccess.file_exists(World.save_path3):
			var save2 = FileAccess.open(World.save_path3, FileAccess.READ)
			var data2 = save2.get_var()
			print(save2)
			$Quit/Label.text = str(data2["pos"])
			var Player = load("res://Scenes/player.tscn").instantiate()  
			Player.position = data2["pos"]
			add_child(Player)
	
func _on_load_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/menu_scene.tscn")
