extends Node

class_name BulletPool

var bullet_scene : PackedScene = preload("res://scenes/player/bullet.tscn")
var pool_size : int = 10
var bullet_pool : Array = []

func _ready() -> void:
	for i in range(pool_size):
		var bullet_temp : Bullet = bullet_scene.instantiate()
		bullet_temp.hide()
		bullet_pool.append(bullet_temp)
		add_child(bullet_temp)

func get_bullet() -> Bullet:
	for bullet in bullet_pool:
		if not bullet.visible:
			return bullet
	
	var new_bullet : Bullet = bullet_scene.instantiate()
	new_bullet.hide()
	bullet_pool.append(new_bullet)
	add_child(new_bullet)
	return new_bullet

func reset_bullet(bullet:Bullet)-> void:
	bullet.position = Vector2(-1000,-1000)
	bullet.hide()
