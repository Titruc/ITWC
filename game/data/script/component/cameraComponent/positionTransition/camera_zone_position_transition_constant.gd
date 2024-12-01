extends cameraZonePositionTransition
class_name cameraZonePositionTansitionConstant

@export var posPoint : cameraZoneBehaviorStartPos

func setup():
	position3D = posPoint.global_position
	
func doSomething():
	if(position3D.distance_to(GameManager.currentCamera.position) > 0.5):
		GameManager.currentCamera.moveFromVect3((position3D - GameManager.currentCamera.position).normalized())
		return false
	else:
		return true
