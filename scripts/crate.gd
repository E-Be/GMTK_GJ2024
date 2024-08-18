@tool
class_name Crate
extends PhysicsBody2D

@export var state: Constants.State = Constants.State.NORMAL:
	set(new_state):
		state = new_state
		
@onready  var hitbox: Hitbox = $Hitbox
@onready var collision_shape_2d = $CollisionShape2D
@onready var sprite_2d = $Sprite2D

var mult = 1


func _ready():
	

	hitbox.hit.connect(tryStateChange)
		
	if (state == Constants.State.SMALL):
		mult = 0.5
	if (state == Constants.State.BIG):
		mult = 2
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
		mult = 0.5
	elif (change == Constants.StateChange.PLUS):
		state += 1
		mult = 2


	resize()
	
	
func resize():
	var lastSize = collision_shape_2d.shape.get_size()
	match(state):
		Constants.State.NORMAL: 
			sprite_2d.scale = Vector2(1,1)
			hitbox.scale = Vector2(1,1)
		Constants.State.SMALL: 
			sprite_2d.scale = Vector2(0.5,0.5)
			hitbox.scale = Vector2(0.5,0.5)
		Constants.State.BIG: 
			sprite_2d.scale = Vector2(2,2)
			hitbox.scale = Vector2(2,2)
 
	collision_shape_2d.shape.set_size(lastSize * mult)
