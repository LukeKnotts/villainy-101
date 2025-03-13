extends AnimatedSprite2D

var mouse_position
var snap_interval = Vector2(0, -24)
var snap_offset = Vector2(0, -24)
var following = true

enum Types {HEAD, FRAME, WEAPON, MOVER}
enum Frames {WOOD, METAL, ARMOR}
enum Weapons {CANNON, BIGCANNON, MORTAR, SAW}
enum Movers {WHEEL, THRUSTER}

@export var text: RichTextLabel
@export var text2: RichTextLabel

var difference = 8
var can_place = false # Decides whether the wall can be placed or not

var menu: CanvasLayer

var placed_already = false # Solely for debug

var destruction_area # Area2D to destroy a wall

var mouse_hovering = false # Whether the mouse is hovering on a wall, used for demolition

func _input(event):
	
	if can_place and placed_already == false:
		print("can_place")
	
	if Input.is_action_just_pressed("LeftClick") and can_place and placed_already == false: # The player is placing the base part
		
		placed_already = true
		
		following = false
		self_modulate = Color(1,1,1,1) # Makes the wall look normal
		
		text2.queue_free()
		
		# Add destruction area to the wall
		var destructor = destruction_area.instantiate()
		destructor.connect("mouse_entered", mouse_entered)
		destructor.connect("mouse_exited", mouse_exited)
		add_child(destructor)
		
		# Takes materials for the wall when it is placed
		await get_tree().create_timer(.01).timeout 
		menu.subtract_resources()
		menu.base_part_being_placed = null
		print("Base_part_being_placed was set to false!")
		Input.set_custom_mouse_cursor(load("res://assets/backgrounds_and_effects/Cursor_Normal_Large.png"), Input.CURSOR_ARROW, Vector2(32, 32))
	#elif self.visible == true and Input.is_action_just_pressed("LeftClick") and can_place == false:
		
	if visible and following and event is InputEventMouseMotion: # Updates the position of the base part
		position = (get_global_mouse_position() - snap_interval).snapped(Vector2 (32, 32)) + snap_interval + snap_offset
	
	if Input.is_action_just_pressed("Interact"): # Cancel building
		if following:
			queue_free()
			print("Building canceled")
			menu.base_part_being_placed = null
			Input.set_custom_mouse_cursor(load("res://assets/backgrounds_and_effects/Cursor_Normal_Large.png"), Input.CURSOR_ARROW, Vector2(32, 32))
	
	

func _ready(): # Sets the base part to the mouse position when a part is selected
	position = (get_global_mouse_position() - snap_interval).snapped(Vector2 (32, 32)) + snap_interval + snap_offset
	menu.base_part_being_placed = self
	self_modulate = Color(0,1,0,.3) # Set it's modulate to be green initially
	z_index = 3500
	
	define_parts()
	
func mouse_entered(): # Makes wall turn red when mouse enters the area to identify ability to destroy
	mouse_hovering = true
	
func mouse_exited(): # Makes wall turn green when mouse exits the area to identify inability to destroy
	mouse_hovering = false

func _process(_delta): # Makes the wall, side wall, and corners rotateable
	if mouse_hovering:
		self_modulate = Color(1,0,0,1)
	elif placed_already:
		self_modulate = Color(1,1,1,1)
	if following == true:
		#position = (get_global_mouse_position() - snap_interval).snapped(Vector2 (32, 32)) + snap_interval + snap_offset
		if part == Options.WALL:
			if Input.is_action_just_pressed("Rotate"):
				print("rotating to side")
				part = Options.SIDE_WALL
				part_rotate()
		elif part == Options.SIDE_WALL:
			if Input.is_action_just_pressed("Rotate"):
				print("rotating to front")
				part = Options.WALL
				part_rotate()
		if part == Options.BOTTOM_LEFT_CORNER:
			if Input.is_action_just_pressed("Rotate"):
				part = Options.TOP_LEFT_CORNER
				part_rotate()
		elif part == Options.BOTTOM_RIGHT_CORNER:
			if Input.is_action_just_pressed("Rotate"):
				part = Options.BOTTOM_LEFT_CORNER
				part_rotate()
		elif part == Options.TOP_LEFT_CORNER:
			if Input.is_action_just_pressed("Rotate"):
				part = Options.TOP_RIGHT_CORNER
				part_rotate()
		elif part == Options.TOP_RIGHT_CORNER:
			if Input.is_action_just_pressed("Rotate"):
				part = Options.BOTTOM_RIGHT_CORNER
				part_rotate()
		
	if self.animation == "DoorClosed" and door_checkers == false and following == false:
		door_checkers = true
		checkers = load("res://scenes/door_areas.tscn").instantiate()
		checkers.door_sprite = self
		add_child(checkers)
		print(checkers)

func part_rotate(): # Change part because they rotated it
	for child in areaness.area.get_children():
		child.queue_free()
	for child in staticness.get_children():
		print("Staticness had a child!?!")
		child.queue_free()
	
	define_parts()

func define_parts(): # Makes the selected wall the correct one
	
	if part == Options.WALL:
		self.frame = 0 # Frames of an animated sprite
		snap_interval = Vector2(32, 32) # Narrows down how it snaps to the tile map
		snap_offset = Vector2(0, -8) # Decides how offset the base part is from the mouse cursor
		difference = 16 # Sets the z-index
		collision = load("res://Resources/wall_collisions/top_wall_collision.tscn")
		destruction_area = load("res://Resources/wall_destruction_areas/top_wall_destruction_area.tscn")
	
	elif part == Options.SIDE_WALL:
		self.frame = 1
		collision = load("res://Resources/wall_collisions/side_wall_collision.tscn")
		snap_interval = Vector2(16, 32)
		snap_offset = Vector2(0, -16.5)
		difference = 32
		destruction_area = load("res://Resources/wall_destruction_areas/side_wall_destruction_area.tscn")
	
	elif part == Options.TOP_RIGHT_CORNER:
		self.frame = 3
		collision = load("res://Resources/wall_collisions/top_right_wall_collision.tscn")
		snap_interval = Vector2(16, 32)
		snap_offset = Vector2(-4, 24.5)
		difference = -44
		destruction_area = load("res://Resources/wall_destruction_areas/top_right_corner_destruction_area.tscn")
	
	elif part == Options.TOP_LEFT_CORNER:
		self.frame = 2
		collision = load("res://Resources/wall_collisions/top_left_wall_collision.tscn")
		snap_interval = Vector2(32, 32)
		snap_offset = Vector2(-13, 24)
		difference = -44
		destruction_area = load("res://Resources/wall_destruction_areas/top_left_corner_destruction_area.tscn")
	
	elif part == Options.BOTTOM_RIGHT_CORNER:
		self.frame = 5
		collision = load("res://Resources/wall_collisions/bottom_right_wall_collision.tscn")
		snap_interval = Vector2(16, 32)
		snap_offset = Vector2(-7, -4.5)
		difference = 32
		destruction_area = load("res://Resources/wall_destruction_areas/bottom_right_corner_destruction_area.tscn")
	
	elif part == Options.BOTTOM_LEFT_CORNER:
		self.frame = 4
		collision = load("res://Resources/wall_collisions/bottom_left_wall_collision.tscn")
		snap_interval = Vector2(16, 32)
		snap_offset = Vector2(7, -4.5)
		difference = 32
		destruction_area = load("res://Resources/wall_destruction_areas/bottom_left_corner_destruction_area.tscn")
	
	elif part == Options.DOOR:
		text.queue_free()
		text2.position = Vector2(11, 41)
		animation = "DoorClosed"
		collision = load("res://Resources/wall_collisions/door_wall_collision.tscn")
		collision2 = load("res://Resources/wall_collisions/door_wall_collision_2.tscn")
		collision3 = load("res://Resources/wall_collisions/door_wall_collision_3.tscn")
		snap_interval = Vector2(32, 32)
		snap_offset = Vector2(0, -8)
		difference = 16
		destruction_area = load("res://Resources/wall_destruction_areas/top_wall_destruction_area.tscn")
	
	position = (get_global_mouse_position() - snap_interval).snapped(Vector2 (32, 32)) + snap_interval + snap_offset
	
	if part != Options.DOOR: # Makes the base part areas when placing their normal collision shape except for the door
		areaness.area.add_child(collision.instantiate())
	else:
		areaness.area.add_child(load("res://Resources/wall_collisions/top_wall_collision.tscn").instantiate())
