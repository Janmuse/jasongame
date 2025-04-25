extends CharacterBody2D

@export var speedset := 60
@onready var health := 3
@onready var timer = $Timer
var speed

func _ready():
	SignalBus.player_damage.connect(take_damage)

func get_input():
	var input_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = input_direction * speed

func take_damage():
	if timer.is_stopped():
		health -=1
		timer.start()

func player_die():
	get_tree().paused = true # WARNING

func _process(_delta):
	if health <= 0:
		player_die()

func _physics_process(_delta):
	
	speed = speedset
	
	if Input.is_action_pressed("shift"):
		speed *= 1.5
	
	get_input()
	move_and_slide()
	
	if Input.is_action_pressed("move_left"):
		$AnimatedSprite2D.flip_h = true
	elif Input.is_action_pressed("move_right"):
		$AnimatedSprite2D.flip_h = false
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite2D.play("walking")
	else:
		$AnimatedSprite2D.play("idle")
		
