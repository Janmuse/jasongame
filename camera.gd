extends Camera2D

@export var player : CharacterBody2D
@export var portrait : AnimatedSprite2D
@export var side : Sprite2D
@export var bg : Sprite2D
@export var movement : bool
#@export var canvas : CanvasLayer


func _physics_process(delta):
	if player and movement == true:
		global_position = player.global_position + Vector2(55, 0)
	
	portrait.global_position = global_position + Vector2(102, -35)
	side.global_position = global_position + Vector2(104, 0)
	bg.global_position = global_position
