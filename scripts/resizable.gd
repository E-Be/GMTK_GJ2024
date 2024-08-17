class_name Resizable
extends PhysicsBody2D

@export var state: Constants.State = Constants.State.NORMAL
@export var hitbox: Hitbox 

func _ready():
	if hitbox:
		hitbox.hit.connect(tryStateChange)
	resize()

func tryStateChange(change: Constants.StateChange):
	print("Try stage change")
	print(change)
	
	match(change):
		Constants.StateChange.MINUS when state == Constants.State.SMALL: 
			print("Tried to resize min object")
			#TODO animation 
		Constants.StateChange.PLUS when state == Constants.State.BIG: 
			print("Tried to resize max object")
			#TODO animation 
		_: 
			changeState(change)
			
func changeState(change: Constants.StateChange):
	if (change == Constants.StateChange.MINUS):
		state -= 1
	elif (change == Constants.StateChange.PLUS):
		state += 1
		
	resize()
	
func resize():
	match(state):
		Constants.State.NORMAL: scale = Vector2(1,1)
		Constants.State.SMALL: scale = Vector2(0.5,0.5)
		Constants.State.BIG: scale = Vector2(2,2)
