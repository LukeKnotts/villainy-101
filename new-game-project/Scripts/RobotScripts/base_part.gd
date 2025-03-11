extends RigidBody2D

enum PartType {Special, Frame, Weapon, Movement}

var Health
var ScrapCost
var MyType

#damages the character
func Damage(amount) -> void:
	Health -= amount
	pass

func _ready() -> void:
	pass
