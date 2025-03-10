extends CharacterBody2D
var speed = 300
func _physics_process(delta: float) -> void:
	var h_direction = Input.get_axis("move_left", "move_right")
	var v_direction = Input.get_axis("move_up", "move_down")
	velocity.y = speed*v_direction
	velocity.x = speed*h_direction
	move_and_slide()
	var World = get_parent()
	World.saved = true
