extends CharacterBody2D
class_name Projectile

const MINUS = preload("res://sprites/Projectiles/minus.png")
const PLUS = preload("res://sprites/Projectiles/plus.png")

@onready var timer = $Timer
@onready var sprite = $Sprite2D
@onready var animation_player = $AnimationPlayer

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
		
	hurtbox.effect = effect
	hurtbox.contact.connect(die)
	
func _physics_process(delta):
	
	velocity = direction * speed
	
	var collision = move_and_collide(velocity * delta)
	
	if collision:
		animation_player.play("death")

func _on_timer_timeout():
	die()

func disapear():
	speed = 0
	visible = false
	
func die():
	queue_free()
