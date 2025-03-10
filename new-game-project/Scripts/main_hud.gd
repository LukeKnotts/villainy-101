extends CanvasLayer
var file = null
func _ready() -> void:
	pass
	


func _physics_process(delta: float) -> void:
	var Menu = load("res://Scenes/world.tscn").instantiate()   
	var file = FileAccess.open(Menu.main_path, FileAccess.READ)
	print(file.get_file_as_string(Menu.saveslot))
	$Quit/Label.text = str(file.get_file_as_string(Menu.saveslot))
	
func _on_load_pressed() -> void:
	var Menu = load("res://Scenes/world.tscn").instantiate()   
	print(Menu)
	Menu.saved = "Save1"
	Menu.save1()
	print(Menu.saved)
	get_tree().change_scene_to_file("res://Scenes/menu_scene.tscn")
