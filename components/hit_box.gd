class_name Hitbox 
extends Area2D

signal hit(effect: Constants.StateChange)

func _ready():
	set_collision_layer_value(1, false)
	set_collision_mask_value(1, false)
	
	set_collision_layer_value(2, true)
	set_collision_mask_value(2, true)
	

func getHit(effect: Constants.StateChange):
	hit.emit(effect)
