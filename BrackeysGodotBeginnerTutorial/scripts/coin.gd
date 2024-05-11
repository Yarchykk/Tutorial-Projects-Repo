extends Area2D



func _on_body_entered(body: Node2D) -> void:
	print("+1 Coin - this is just a print statment with no functionality")
	queue_free()
