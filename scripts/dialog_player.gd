extends CanvasLayer

@onready var label = $Label
@onready var timer = $Timer
@onready var SFX_dialogo = $SFX_dialogo

const CHAR_READ_RATE = 0.1
var check = false

func _ready():
	SignalBus.display_dialog.connect(on_display_dialog)
	#add_text("SUS!!!")

func on_display_dialog(key: String):
	if !check:
		check = true
		var text = GlobalDialogues.dialogues[key]
		add_text(text)

func add_text(text: Array):
	label.text = ""
	get_tree().paused = true
	for i in text:
		typewriter_effect(i)
		var puta = CHAR_READ_RATE * len(i) + 2.0
		await get_tree().create_timer(puta).timeout
		#label.text = ""
	label.text = ""
	get_tree().paused = false

func typewriter_effect(text: String):
	var full_text := text
	reveal_text(text)
	label.text 

func reveal_text(text: String):
	var current := ""
	for i in text.length():
		current += text[i]
		label.text = current
		await get_tree().create_timer(CHAR_READ_RATE).timeout
		# Si el carácter no es espacio, reproduce sonido
		if text[i] != " ":
			SFX_dialogo.stop() # reinicia el audio si estaba reproduciendo
			SFX_dialogo.play()
	check = false
