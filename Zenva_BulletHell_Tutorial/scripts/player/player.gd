extends CharacterBody2D

var speed: int = 75
var direction : Vector2	= Vector2(0,1)

@onready var bullet_pool : BulletPool = get_node("BulletPool")

func _physics_process(delta: float) -> void:
	
	##Update Movement Vector
	var inputDir : Vector2 = Vector2(
		Input.get_axis("ui_left","ui_right"),
		Input.get_axis("ui_up","ui_down")).normalized()
	
	##Update Animation
	if inputDir.x > 0: 		#Move Right
		get_node("PlayerSprite").frame = 1
		get_node("PlayerSprite").flip_h = false
		direction = inputDir
	elif inputDir.x < 0: 	#Move Left
		get_node("PlayerSprite").frame = 1
		get_node("PlayerSprite").flip_h = true
		direction = inputDir
	elif inputDir.y > 0: 	#Move Down
		get_node("PlayerSprite").frame = 0
		get_node("PlayerSprite").flip_h = false
		direction = inputDir
	elif inputDir.y < 0: 	#Move Up
		get_node("PlayerSprite").frame = 2
		get_node("PlayerSprite").flip_h = false
		direction = inputDir
	
	##Update Bullet Spawn Point
	get_node("SpawnPoint").position = direction*10
	
	##Shooting
	if Input.is_action_pressed("Shoot"):
		var bulletTemp : Bullet = bullet_pool.get_bullet()
		bulletTemp.velocity = direction*100
		bulletTemp.global_position = get_node("SpawnPoint").global_position
		bulletTemp.show()
	
	##Update Movement
	velocity = inputDir * speed
	move_and_slide()
