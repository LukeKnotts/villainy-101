extends CharacterBody2D
var speed = 10000
const bulletPath = preload('res://bullet.tscn')

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

func _process(delta):
	if Input.is_action_just_pressed("Leftclick"):
		shoot()
		
		$Node2D.look_at(get_global_mouse_position())

func shoot():
	var bullet = bulletPath.instantiate()
	get_parent().add_child(bullet)
	bullet.position = $Node2D/Marker2D.global_position
	
	bullet.bulletvelocity = get_global_mouse_position() - bullet.position
	bullet.visible = false
	await get_tree().create_timer(0.1).timeout
	bullet.visible = true 
	bullet.collision_layer = true
