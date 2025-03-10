extends CanvasLayer
var file = null
func _ready() -> void:
	pass
	


func _physics_process(delta: float) -> void:
	var Menu = load("res://Scenes/world.tscn").instantiate()   
	print(Menu.save_path1)
	var file = FileAccess.open(Menu.save_path1, FileAccess.READ)
	$Quit/Label.text = str(file.get_var(Menu.saveslot))
	
func _on_load_pressed() -> void:
	var Menu = load("res://Scenes/world.tscn").instantiate()   
	print(Menu)
	Menu.saved = "Save1"
	Menu.save1()
	print(Menu.saved)
	get_tree().change_scene_to_file("res://Scenes/menu_scene.tscn")
