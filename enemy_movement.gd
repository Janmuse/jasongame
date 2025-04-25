extends CharacterBody2D

@export var speed = 60

@export var player : CharacterBody2D
@onready var nav_agent := $NavigationAgent2D as NavigationAgent2D

func _ready():
	makepath()

func _physics_process(_delta: float):
	if nav_agent.is_navigation_finished():
		$AnimatedSprite2D.play("default")
		velocity = Vector2.ZERO
	else:
		$AnimatedSprite2D.play("chase")
		var direction = (nav_agent.get_next_path_position() - global_position).normalized()
		velocity = direction * speed
	
	move_and_slide()

func makepath():
	nav_agent.target_position = player.global_position

func _on_timer_timeout():
	makepath()
