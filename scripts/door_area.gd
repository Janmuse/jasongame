extends Area2D

@export var key = ""
var area_active = false
var doorscene : String

func _ready():
	SignalBus.end_fadein.connect(transition)

func _input(event):
	if area_active and event.is_action_pressed("interact"):
		#SignalBus.emit_signal("use_door", key)
		doorscene = RoomDirections.rooms[key]
		SignalBus.emit_signal("start_fadein")

func transition():
	get_tree().change_scene_to_file(doorscene)

func _on_area_entered(area):
	area_active = true

func _on_area_exited(area):
	area_active = false
