extends Node3D
class_name cameraZonePositionTransition

var cameraZoneVar : cameraZone
var position3D : Vector3 = Vector3.ZERO

func _ready():
	cameraZoneVar = self.get_parent().get_parent()
	setup()

func setup():
	pass

func doSomething():
	return true
