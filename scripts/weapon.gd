class_name Weapon

extends Node2D

@export var projectile: PackedScene = preload("res://scenes/projectile.tscn")

var canFire = true
var fireTimer: Timer

func _ready():
	
	fireTimer = Timer.new()
	fireTimer.one_shot = true 
	fireTimer.timeout.connect(on_fire_timer_timeout)

	add_child(fireTimer)
	
func fire(effect: Constants.StateChange, direction : Vector2):
	
	if canFire:
		canFire = false
		# delay between shots
		fireTimer.start(1)
		
		instantiate_projectile(effect, direction)

func instantiate_projectile(effect: Constants.StateChange, direction : Vector2):
	var newProjectile = projectile.instantiate()

	newProjectile.effect = effect

	get_tree().get_root().add_child(newProjectile)
	
	newProjectile.direction = direction
	newProjectile.global_position = global_position + (direction * 18)
		
func on_fire_timer_timeout():
	canFire = true
		


