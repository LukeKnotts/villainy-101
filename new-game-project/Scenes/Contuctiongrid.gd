extends TileMapLayer
#needs Gridsize to work, set it to 12 beucse that is the work area
#All of this works only in Contruction code grid
#Conruction Area does not have code and just shows were the player can place stuff down
var GridSize = 12
var GridMinimum = Vector2(6, 2)
var GridMaximum = Vector2(17, 13)
#Set tile and code will be decribed in documentation, pls read.

func tileInBounds(tile: Vector2):
	return not (
		tile.x < GridMinimum.x 
		or tile.x > GridMaximum.x 
		or tile.y < GridMinimum.y 
		or tile.y > GridMaximum.y
	)

func _input(event):

	if Input.is_action_just_pressed("Leftclick"):
		var tile = local_to_map(get_global_mouse_position())
		if not (tileInBounds(tile)): return
		set_cell(tile, 0, Vector2i(0,0), 0)

	if Input.is_action_just_pressed("RightClick"):
		var tile = local_to_map(get_global_mouse_position())	
		if not (tileInBounds(tile)): return
		erase_cell(tile)
