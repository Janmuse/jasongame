extends Area2D

@export var key : String
@export var oneTime : bool
var areaActive = false
var checkOneTime = false

func _input(event):
	if areaActive and checkOneTime == false:
		SignalBus.emit_signal("display_dialog", key)
		if oneTime == true:
			checkOneTime = true;

func _on_area_entered(area):
	areaActive = true

func _on_area_exited(area):
	areaActive = false
