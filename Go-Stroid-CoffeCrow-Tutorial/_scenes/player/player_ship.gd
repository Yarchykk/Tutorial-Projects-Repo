class_name Class_PlayerShip
extends CharacterBody2D


@export var acceleration_speed : float = 10.0;
@export var deceleration_speed : float = 5.0;
@export var max_speed : float = 300.0;


func _physics_process(delta: float) -> void:
	look_at_mouse_position()
	handle_acceleration()
	
	move_and_slide()

func look_at_mouse_position()->void:
	var mouse_position : Vector2 = get_global_mouse_position()
	look_at(mouse_position)


func handle_acceleration()->void:
	if Input.is_action_pressed("accelerate"):
		velocity = velocity.move_toward(transform.x * max_speed,acceleration_speed)
		return
	
	velocity = velocity.move_toward(Vector2.ZERO, deceleration_speed)
