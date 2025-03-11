extends CharacterBody2D
var speed = 10000
func _physics_process(_delta: float) -> void:
	var h_direction = Input.get_axis("move_left", "move_right") #if input is left return -1 else return 1
	var v_direction = Input.get_axis("move_up", "move_down") #if input is up return 1 else return -1
	velocity.y = speed*v_direction*get_process_delta_time()
	velocity.x = speed*h_direction*get_process_delta_time()

	##Saving Position
	var World = load("res://Scenes/world.tscn").instantiate() #gets the world scene
	var save = FileAccess.open(World.main_path, FileAccess.READ)
	var data = save.get_var() #acsesses the data to determine what save slot we are in
	if data["saveslot"] == "Slot1":
		World.save_data["pos"] = position #saves the position we just moved to to the world
		World.save1()
	elif data["saveslot"] == "Slot2":
		World.save_data["pos"] = position
		World.save2()
	elif data["saveslot"] == "Slot3":
		World.save_data["pos"] = position
		World.save3()
	move_and_slide()
