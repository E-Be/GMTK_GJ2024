extends Node

@onready var music = %Music
@onready var zap = %Zap
@onready var jump = %Jump
@onready var button_click_on = %ButtonClickOn
@onready var button_click_off = %ButtonClickOff

func playZap():
	zap.play()

func playJump():
	jump.play()

func playButtonOn():
	button_click_on.play()
	
func playButtonOff():
	button_click_off.play()
