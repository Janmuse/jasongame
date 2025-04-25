extends CanvasLayer

func _ready():
	SignalBus.start_fadein.connect(fadetob)
	SignalBus.transitioned_scene.connect(transitioned)

func fadetob():
	$AnimationPlayer.play("fadein")

func transitioned():
	$AnimationPlayer.play("fadeout")

func _on_animation_player_animation_finished(anim_name):
	if(anim_name == "fadein"):
		SignalBus.emit_signal("end_fadein")
