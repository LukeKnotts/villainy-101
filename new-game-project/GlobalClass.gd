extends Node

enum RobotParts {
	Cannon = 0,
	UpgradedCannon = 1,
	WoodenFrame = 2,
	MetalFrame = 3,
	ArmoredFrame = 4,
	Mortar = 5,
	Saw = 6
}

func MakeData(animation: String, frame: int, title: String, seperateAnimation: String = "None"):
	return {
		Animation = animation,
		Frame = frame,
		Title = title
	}
	

var Assets = {
	Cannons = load("res://assets/Cannons.png"),
	Frames = load("res://assets/Frames.png"),
	Head = load("res://assets/Head.png"),
	Mortar = load("res://assets/Mortar.png"),
	Saw = load("res://assets/Saw.png")
}

var RobotData = [
	MakeData("Cannons", 0, "Cannon"),
	MakeData("Cannons", 1, "Upgraded Cannon"),
	MakeData("Frames", 0, "Wooden Frame"),
	MakeData("Frames", 1, "Metal Frame"),
	MakeData("Frames", 2, "ArmoredFrames"),
	MakeData("Mortar", 0, "Mortar"),
	MakeData("Saw", 0, "Saw", "SawMoving")
]
