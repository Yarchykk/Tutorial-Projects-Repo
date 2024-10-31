class_name Class_LargeAsteroid
extends CharacterBody2D

const MOVEMENT_DIRECTION : Vector2 = Vector2.RIGHT

@export var move_speed : float = 1.0


func _ready() -> void:
	randomize_movement_direction()

func _physics_process(delta: float) -> void:
	handle_movement()
	move_and_slide()

func randomize_movement_direction()->void:
	rotation = randf_range(0,TAU) #see TAU documentation for more info

func handle_movement()->void:
	global_position+=(MOVEMENT_DIRECTION*move_speed).rotated(rotation)
