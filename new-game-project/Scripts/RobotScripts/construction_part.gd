extends AnimatedSprite2D

var mouse_position
var snap_interval = Vector2(0, 16)
var snap_offset = Vector2(0, 0)
var following = true

# enumerators to set which part you are placing, 
enum Types {HEAD, FRAME, WEAPON, MOVER}
enum Frames {WOOD, METAL, ARMOR}
enum Weapons {CANNON, BIGCANNON, MORTAR, SAW}
enum Movers {WHEEL, THRUSTER}
@export var current_type: Types
@export var current_part: int = Frames.WOOD

var can_place = true # Decides whether the part can be placed or not, use the Area2D to check the type and position of other parts

var placed_already = false # Solely for debug

func _input(event):
	
	if can_place and placed_already == false:
		print("can_place")
	
	if Input.is_action_just_pressed("Leftclick") and can_place and placed_already == false: # The player is placing the base part
		
		placed_already = true
		
		following = false
		self_modulate = Color(1,1,1,1) # Makes the part look normal
		
		# Takes materials for the wall when it is placed
		await get_tree().create_timer(.01).timeout 
		print("part_being_placed was set to false!")
	#elif self.visible == true and Input.is_action_just_pressed("LeftClick") and can_place == false:
		
	if visible and following and event is InputEventMouseMotion: # Updates the position of the base part
		position = (get_global_mouse_position() - snap_interval).snapped(Vector2 (16, 16)) + snap_interval + snap_offset
	

func _ready(): # Sets the base part to the mouse position when a part is selected
	position = (get_global_mouse_position() - snap_interval).snapped(Vector2 (16, 16)) + snap_interval + snap_offset
	self_modulate = Color(0,1,0,.3) # Set it's modulate to be green initially
	z_index = 3500
	
	define_parts(current_type, current_part)

func _process(_delta): # Makes the wall, side wall, and corners rotateable
	pass

func define_parts(type, part): # Makes the selected part the correct one
	
	if type == Types.HEAD:
		self.frame = 1 # Frames of an animated sprite
	
	elif type == Types.FRAME:
		if part == Frames.WOOD:
			self.frame = 0
		elif part == Frames.METAL:
			self.frame = 1
		elif part == Frames.ARMOR:
			self.frame = 2
	
	elif type == Types.WEAPON:
		if part == Weapons.CANNON:
			self.frame = 3
		elif part == Weapons.BIGCANNON:
			self.frame = 4
		elif part == Weapons.MORTAR:
			self.frame = 5
		elif part == Weapons.SAW:
			self.frame = 6
	
	elif type == Types.MOVER:
		if part == Movers.WHEEL:
			self.frame = 7
		elif part == Movers.THRUSTER:
			self.frame = 8
	
	position = (get_global_mouse_position() - snap_interval).snapped(Vector2 (16, 16)) + snap_interval + snap_offset
