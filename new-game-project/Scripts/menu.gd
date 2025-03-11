extends CanvasLayer

#@onready var savebutton1 = $CenterBox/Slot1
#@onready var savebutton2 = $CenterBox/Slot2
#@onready var savebutton3 = $CenterBox/Slot3
#@onready var backbutton = $LowerBox/Back
#@onready var loadbutton = $CenterBox/Load
@onready var MainBox = $MainBox
@onready var SlotsBox = $CenterBox
@onready var lowerBox = $LowerBox

func _ready() -> void:
	pass
	
func _on_load_pressed() -> void: #shows the save slots
	SlotsBox.visible = true
	lowerBox.visible = true
	MainBox.visible = false
	
	#savebutton1.set_deferred("visible", true)
	#savebutton2.set_deferred("visible", true)
	#savebutton3.set_deferred("visible", true)
	#backbutton.set_deferred("visible", true)
	#loadbutton.set_deferred("visible", false)
	
func _on_back_pressed() -> void: #resets the scene back to main menu
	get_tree().reload_current_scene()

func _on_slot_1_pressed() -> void: #saves the name of the load slot to world
	get_parent().load1()
	get_tree().change_scene_to_file("res://Scenes/world.tscn")
	
func _on_slot_2_pressed() -> void:
	get_parent().load2()
	get_tree().change_scene_to_file("res://Scenes/world.tscn")
	
func _on_slot_3_pressed() -> void:
	get_parent().load3()
	get_tree().change_scene_to_file("res://Scenes/world.tscn")

#Called when the new game is pressed. Currently the same code as the load button.
func NewGamePressed() -> void:
	SlotsBox.visible = true
	lowerBox.visible = true
	MainBox.visible = false

func QuitPressed() -> void:
	get_tree().quit()#quits the game
