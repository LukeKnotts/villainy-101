extends TileMapLayer
#needs Gridsize to work, set it to 12 beucse that is the work area
#All of this works only in Contruction code grid
#Conruction Area does not have code and just shows were the player can place stuff down
var GridSize = 12
var GridMinimum = Vector2(6, 2)
var GridMaximum = Vector2(17, 13)
#Set tile and code will be decribed in documentation, pls read.

var grid = []

## Generates a 12x12 Grid of purly null
func prepareGrid():
	var emptyGrid = []
	for i in 12:
		emptyGrid.append([])
		emptyGrid[0].append(null)
		
	for i in range(1, 12):
		if (i != 0):
			emptyGrid[i] = emptyGrid[0].duplicate()
			
	return emptyGrid

func _ready() -> void:
	grid = prepareGrid()

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
		grid[tile.x][tile.y] = {}
		print(grid)
		
	if Input.is_action_just_pressed("RightClick"):
		var tile = local_to_map(get_global_mouse_position())	
		if not (tileInBounds(tile)): return
		grid[tile.x][tile.y] = null
		print(grid)
