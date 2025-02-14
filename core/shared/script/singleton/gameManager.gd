extends Node

#player and camera stuff
@export var currentCamera : theBestCameraEver
@export var player : CharacterBody3D

#global game stuff
@export var head : gameHead

#build relatead stuff
@export var lang : Dictionary
@export var gamePath : String


func setCurrentCamera(cam : theBestCameraEver):
	currentCamera = cam
	
func setCurrentPlayer(play : CharacterBody3D):
	player = play

#physics
@export var invDelta : float = 1.0
