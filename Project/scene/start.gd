extends CanvasLayer

var startbutton
var quitbutton

# Called when the node enters the scene tree for the first time.
func _ready():
	startbutton = $Control/MarginContainer/VBoxContainer/StartBtn
	quitbutton = $Control/MarginContainer/VBoxContainer/QuitBtn

	startbutton.pressed.connect(_on_start_button_pressed)
	quitbutton.pressed.connect(_on_quit_button_pressed)
	#startbutton.pressed.connect(ChoosenTable)
	pass # Replace with function body.

func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://scene/ChoosenTable.tscn")
# Called every frame. 'delta' is the elapsed time since the previous frame.

func _on_quit_button_pressed():
	get_tree().quit()
	
func _process(delta):
	pass
