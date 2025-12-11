extends CharacterBody2D

class_name Bullet

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	self.rotation += 1
	move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.get("mob"):
		if body.is_alive and body.visible and self.visible:
			body.reset_mob(body)
			get_parent().reset_bullet(self)
