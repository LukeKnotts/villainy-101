extends CanvasLayer

@onready var savebutton1 = $CenterBox/Slot1
@onready var savebutton2 = $CenterBox/Slot2
@onready var savebutton3 = $CenterBox/Slot3
@onready var backbutton = $LowerBox/Back
@onready var loadbutton = $CenterBox/Load

func _ready() -> void:
	pass
	
func _on_load_pressed() -> void:
	savebutton1.set_deferred("visible", true)
	savebutton2.set_deferred("visible", true)
	savebutton3.set_deferred("visible", true)
	backbutton.set_deferred("visible", true)
	loadbutton.set_deferred("visible", false)
	
func _on_back_pressed() -> void:
	savebutton1.set_deferred("visible", false)
	savebutton2.set_deferred("visible", false)
	savebutton3.set_deferred("visible", false)
	backbutton.set_deferred("visible", false)
	loadbutton.set_deferred("visible", true)

func _on_slot_1_pressed() -> void:
	get_parent().load1()
	var World = load("res://Scenes/world.tscn").instantiate()
	World.save1()
	get_tree().change_scene_to_file("res://Scenes/world.tscn")
	
func _on_slot_2_pressed() -> void:
	get_parent().load2()
	var World = load("res://Scenes/world.tscn").instantiate()
	World.save2()
	get_tree().change_scene_to_file("res://Scenes/world.tscn")
	
func _on_slot_3_pressed() -> void:
	get_parent().load3()
	var World = load("res://Scenes/world.tscn").instantiate()
	World.save3()
	get_tree().change_scene_to_file("res://Scenes/world.tscn")
