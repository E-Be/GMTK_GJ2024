class_name DoorButton
extends Area2D

@onready var sprite_pushed = $Sprite_pushed
@onready var sprite_not_pushed = $Sprite_not_pushed

signal isActivatedSignal(activated: bool)

var listBoxOn: Array[Crate]

func _process(delta):
	var gotActivated = false
	
	for crate in listBoxOn:
		if crate.state != Constants.State.SMALL:
			gotActivated = true
			activate(true)
			break
			
	if not listBoxOn.is_empty() and not gotActivated:
		activate(false)

			
func _on_body_entered(body):
	if body is Crate:
		listBoxOn.append(body)
	elif body is Player:
		activate(true)

func activate(activated: bool):
	if activated:
		sprite_pushed.visible = true
		sprite_not_pushed.visible = false
		isActivatedSignal.emit(true)
	else: 
		sprite_pushed.visible = false
		sprite_not_pushed.visible = true
		isActivatedSignal.emit(false)
	
func _on_body_exited(body):
	if body is Crate:
		listBoxOn.erase(body)
	elif body is Player:
		activate(false)

