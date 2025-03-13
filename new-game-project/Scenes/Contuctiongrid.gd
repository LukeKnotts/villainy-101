extends TileMapLayer

var GridSize = 12
var GridMinimum = Vector2(6, 2)
var GridMaximum = Vector2(17, 13)

var deltaCounter = 0

var grid = []
var selectedPart = GlobalClass.RobotParts.WoodenFrame
var displayPart: AnimatedSprite2D

var buildPartBase = preload("res://Scenes/RobotParts/BuildPartBase.tscn")

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
	

## Adds the Sprite to the Grid with the necessary data
func AddToGrid(tile: Vector2i):
	var buildPart: AnimatedSprite2D = buildPartBase.instantiate()
	var partData = GlobalClass.RobotData[selectedPart]
	
	RemoveFromGrid(tile)
	
	grid[tile.x-7][tile.y-2] = {
		PartSprite = buildPart,
		PartData = partData,
		PartTile = tile
	}
	
	get_tree().root.add_child(buildPart)
	buildPart.position = Vector2((tile.x * 16) + 13, (tile.y * 16) + 8)
	
	if (partData.SeperateAnimation == "None"):
		buildPart.animation = partData.Animation
		buildPart.frame = partData.Frame
		buildPart.speed_scale = 0
	else:
		print("added alternate?")
		buildPart.animation = partData.SeperateAnimation
		buildPart.speed_scale = 1
		buildPart.play(partData.SeperateAnimation)

func RemoveFromGrid(tile: Vector2i):
	var foundPart = grid[tile.x-7][tile.y-2]
	if (foundPart == null): return
	if (foundPart.PartSprite):
		foundPart.PartSprite.free()
		grid[tile.x-7][tile.y-2] = null

func UpdateDisplayPart():
	var foundPart = GlobalClass.RobotData[selectedPart]
	displayPart.animation = foundPart.Animation
	displayPart.frame = foundPart.Frame
	displayPart.speed_scale = 0

func _ready() -> void:
	displayPart = buildPartBase.instantiate()
	grid = prepareGrid()
	UpdateDisplayPart()
	
	get_tree().root.call_deferred("add_child", displayPart)
	
	displayPart.position = Vector2(384, 118)

func _process(delta: float) -> void:
	deltaCounter += delta
	if (displayPart == null): 
		print("Strange error") 
		return
	displayPart.position = Vector2(384, 118 + round(sin(deltaCounter * 0.8) * 5))

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
		AddToGrid(tile)
		
	if Input.is_action_just_pressed("RightClick"):
		var tile = local_to_map(get_global_mouse_position())	
		if not (tileInBounds(tile)): return
		RemoveFromGrid(tile)
		
	if Input.is_action_just_pressed("move_left"):
		selectedPart = (selectedPart - 1) % GlobalClass.RobotParts.values().size()
		UpdateDisplayPart()
		
	if Input.is_action_just_pressed("move_right"):
		selectedPart = (selectedPart + 1) % GlobalClass.RobotParts.values().size()
		UpdateDisplayPart()
