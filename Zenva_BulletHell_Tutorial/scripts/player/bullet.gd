extends CharacterBody2D

class_name Bullet

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	self.rotation += 1
	move_and_slide()
