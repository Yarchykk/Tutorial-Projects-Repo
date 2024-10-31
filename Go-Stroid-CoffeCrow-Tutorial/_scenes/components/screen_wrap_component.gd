class_name Class_ScreenWrapComponent
extends Node2D

@onready var screen_size : Vector2 = get_viewport_rect().size

var parent_node : Node2D = null

func _ready() -> void:
	set_parent()

func _process(delta):
	handle_object_wrap()

func set_parent() -> void:
	parent_node = get_parent()

func handle_object_wrap() -> void:
	#Account for x screen wrapping
	if parent_node.position.x >screen_size.x:
		parent_node.position.x = 0
	if parent_node.position.x < 0:
		parent_node.position.x = screen_size.x
	#Account for y screen wrapping
	if parent_node.position.y >screen_size.y:
		parent_node.position.y = 0
	if parent_node.position.y < 0:
		parent_node.position.y = screen_size.y
