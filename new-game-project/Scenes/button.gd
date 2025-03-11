extends Button
var grid

var mouse_offset = [0,0]
var start = Vector2(self.position)

func _ready():
	var grid = $TextureRect
	


func _process(delta):
	if button_pressed == true:
		self.position[0] = get_global_mouse_position()[0]+mouse_offset[0]
		self.position[1] = get_global_mouse_position()[1]+mouse_offset[1]


func _on_button_down() -> void:

	mouse_offset[0] = self.position[0] - get_global_mouse_position()[0]
	mouse_offset[1] = self.position[1] - get_global_mouse_position()[1]
	


func _on_button_up() -> void:
	#you need to check if the mouse is hovering over a button if so check if you can place the object then place it. 	
	self.position = start
