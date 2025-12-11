extends Node2D

class_name MobPooling

var mob_scene : PackedScene = preload("res://scenes/enemy/snake_mob.tscn")
var pool_size : int = 10
var mob_pool : Array = []

@onready var timer: Timer = get_node("Timer")

func _ready() -> void:
	##Init mob Pool
	for i in range(pool_size):
		var mob_temp : SnakeMob = mob_scene.instantiate()
		mob_temp.hide()
		mob_pool.append(mob_temp)
		add_child(mob_temp)




func get_mob() -> SnakeMob:
	##Return mob if it is not being used
	for mob in mob_pool:
		if not mob.visible:
			return mob
	
	##If all mobs in poll are being used 
	##Add a new mob to pool
	var new_mob : SnakeMob = mob_scene.instantiate()
	new_mob.hide()
	mob_pool.append(new_mob)
	add_child(new_mob)
	return new_mob


func reset_mob(mob:SnakeMob)-> void:
	mob.position = Vector2(-1000,-1000)
	mob.is_alive = false
	mob.get_node("CollisionShape2D").disabled = false
	mob.hide()


func _on_timer_timeout() -> void:
	var mobTemp = get_mob()
	var randY : int = randi_range(-25,25) 
	var randX : int = randi_range(-25,25) 
	mobTemp.global_position = self.global_position + Vector2 (randX,randY)
	mobTemp.show()
