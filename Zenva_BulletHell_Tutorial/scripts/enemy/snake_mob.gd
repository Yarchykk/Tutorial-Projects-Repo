extends CharacterBody2D

class_name SnakeMob

var is_alive : bool = true
var speed : int = 25
var mob : bool = true

@onready var player_ref: CharacterBody2D = $"../../Player"
@onready var sprite: Sprite2D = $GuardianSerpentOld

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	
	if is_alive:
		var direction : Vector2 = (player_ref.global_position - self.global_position).normalized()
		velocity = speed*direction
		move_and_slide()
		
		if direction.x > 0:
			sprite.flip_h = true
		else:
			sprite.flip_h = false
	else: 
		sprite.hide()
	

func reset_mob(body:SnakeMob)-> void:
	get_parent().reset_mob(body)
