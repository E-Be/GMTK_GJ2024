class_name Hurtbox
extends Area2D

var effect: Constants.StateChange

signal contact()

func _ready() -> void:
	set_collision_layer_value(1, false)
	set_collision_mask_value(1, false)
	
	set_collision_layer_value(2, true)
	set_collision_mask_value(2, true)
			
	area_entered.connect(on_area_entered)


func on_area_entered(area: Area2D):
	if (area is Hitbox):
		area.getHit(effect)
		contact.emit()
		
