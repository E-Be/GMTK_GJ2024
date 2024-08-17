class_name Player
extends Resizable


const SPEED = 300.0

@export var jumpHeigth: float = 48
@export var jumpTimeToPeak: float = 0.4
@export var jumpTimeToDescent: float = 0.25

@export var weapon: Weapon

@onready var jump_velocity: float = ((2.0 * jumpHeigth) / jumpTimeToPeak ) * -1
@onready var jump_gravity: float = ((-2.0 * jumpHeigth) / (jumpTimeToPeak * jumpTimeToPeak)) * -1
@onready var fall_gravity: float = ((-2.0 * jumpHeigth) / (jumpTimeToPeak * jumpTimeToDescent)) * -1

var shootDirection: Vector2 = Vector2(1,0)
var canMove = true

func jump():
	velocity.y = jump_velocity
	
func getGravity():
	return jump_gravity if velocity.y < 0.0 else fall_gravity

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += getGravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		jump()

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("move_left", "move_right")
	if direction:
		shootDirection = Vector2(direction, 0)
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	var directionY = Input.get_axis("look_up", "look_down")
	if directionY:
		shootDirection = Vector2(0, directionY)
		
	#Shoot
	if Input.is_action_pressed("shoot_minus"):
		if weapon:
			weapon.fire(Constants.StateChange.MINUS, shootDirection)
	if Input.is_action_pressed("shoot_plus"):
		if weapon:
			weapon.fire(Constants.StateChange.PLUS, shootDirection)

	if not canMove:
		velocity.x = 0
	
	move_and_slide()
