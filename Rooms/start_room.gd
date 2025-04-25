extends Node2D

@export var spawnPlayer : Marker2D
@export var spawnEnemy : Marker2D
@export var player : CharacterBody2D
@export var enemy : CharacterBody2D

func _ready():
	player.global_position = spawnPlayer.global_position
	SignalBus.emit_signal("transitioned_scene")
