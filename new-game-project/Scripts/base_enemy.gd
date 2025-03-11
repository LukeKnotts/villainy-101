extends RigidBody2D

var Health

#damages the character
func Damage(amount) -> void:
	Health -= amount
	pass
