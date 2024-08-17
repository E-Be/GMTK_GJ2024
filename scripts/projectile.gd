extends CharacterBody2D
class_name Projectile

const MINUS = preload("res://sprites/Projectiles/minus.png")
const PLUS = preload("res://sprites/Projectiles/plus.png")

@onready var timer = $Timer
@onready var sprite = $Sprite2D

@export var hurtbox : Hurtbox
@export var speed : float = 350

var effect: Constants.StateChange
var direction: Vector2

func _ready():
	timer.start(1)
	
	if (effect == Constants.StateChange.MINUS):
		sprite.texture = MINUS
	else :
		sprite.texture = PLUS
		
	if hurtbox:
		hurtbox.effect = effect
	
func _physics_process(delta):
	
	velocity = direction * speed
	
	var collision = move_and_collide(velocity * delta)
	
	if collision:
		queue_free()

func _on_timer_timeout():
	queue_free()

