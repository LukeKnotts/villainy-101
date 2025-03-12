extends TileMapLayer
#needs Gridsize to work, set it to 12 beucse that is the work area
#All of this works only in Contruction code grid
#Conruction Area does not have code and just shows were the player can place stuff down
var GridSize = 12
#Set tile and code will be decribed in documentation, pls read.
func _input(event):
	#Left click adds a block
	if Input.is_action_just_pressed("Leftclick"):
		var tile = local_to_map(get_global_mouse_position())	
		for x in GridSize:
			for y in GridSize:
				set_cell(tile, 0, Vector2i(0,0), 0)
	#Right click removes a block
	if Input.is_action_just_pressed("RightClick"):
		var tile = local_to_map(get_global_mouse_position())	
		for x in GridSize:
			for y in GridSize:
				erase_cell(tile)
		
	

	
