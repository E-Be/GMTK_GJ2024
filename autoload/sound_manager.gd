extends Node

@onready var music = %Music
@onready var door = %Door
@onready var zap = %Zap
@onready var jump = %Jump
@onready var button_click_on = %ButtonClickOn
@onready var button_click_off = %ButtonClickOff
@onready var error = %Error
var menuMusic = preload("res://audio/menu.mp3")
var levelMusic = preload("res://audio/level.mp3")


func playZap():
	zap.play()

func playJump():
	jump.play()

func playButtonOn():
	button_click_on.play()
	
func playButtonOff():
	button_click_off.play()
	
func playError():
	error.play()

func playMenuMusic():
	music.stream = menuMusic
	music.play()
	
func playDoorSound():
	door.play()
	
func playLevelMusic():
	music.stream = levelMusic
	music.play()
	
