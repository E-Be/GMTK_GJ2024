class_name Resizable
extends CharacterBody2D

@export var state: Constants.State = Constants.State.NORMAL

func _ready():
	resize()

func tryStateChange(change: Constants.StateChange):
	match(change):
		Constants.StateChange.MINUS when state == Constants.State.SMALL: 
			pass
			#TODO animation 
		Constants.StateChange.PLUS when state == Constants.State.BIG: 
			pass
			#TODO animation 
		_: 
			changeState(change)
			
func changeState(change: Constants.StateChange):
	state += change
	resize()
	
func resize():
	match(state):
		Constants.State.NORMAL: scale = Vector2(1,1)
		Constants.State.SMALL: scale = Vector2(0.5,0.5)
		Constants.State.BIG: scale = Vector2(2,2)
