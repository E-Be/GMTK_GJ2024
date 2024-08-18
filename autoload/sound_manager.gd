extends Node

@onready var music = %Music
@onready var zap = %Zap
@onready var jump = %Jump

func playZap():
	zap.play()

func playJump():
	jump.play()
