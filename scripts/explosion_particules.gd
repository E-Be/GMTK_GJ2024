extends Node2D

@onready var cpu_particles_2d = $CPUParticles2D
var color: Color = Color.YELLOW

func _ready():
	cpu_particles_2d.color = color
	cpu_particles_2d.emitting = true
	print("Particules")
