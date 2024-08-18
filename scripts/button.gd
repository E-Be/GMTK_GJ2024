class_name DoorButton
extends Area2D

@onready var sprite_pushed = $Sprite_pushed
@onready var sprite_not_pushed = $Sprite_not_pushed

signal isActivatedSignal(activated: bool)

var state: bool = false
var listBoxOn: Array[Crate]

func _process(delta):
	var gotActivated = false
	
	for crate in listBoxOn:
		if crate.state != Constants.State.SMALL:
			gotActivated = true
			switch(true)
			break
			
	if not listBoxOn.is_empty() and not gotActivated:
		switch(false)

			
func _on_body_entered(body):
	if body is Crate:
		listBoxOn.append(body)
	elif body is Player:
		switch(true)

func activate(activated: bool):
	if activated:
		sprite_pushed.visible = true
		sprite_not_pushed.visible = false
		isActivatedSignal.emit(true)
		SoundManager.playButtonOn()
	else: 
		sprite_pushed.visible = false
		sprite_not_pushed.visible = true
		isActivatedSignal.emit(false)
		SoundManager.playButtonOff()
	
func _on_body_exited(body):
	if body is Crate:
		listBoxOn.erase(body)
	elif body is Player:
		switch(false)

func switch(onOff: bool):
	if state == onOff:
		pass
	else:
		state = onOff
		activate(onOff)
