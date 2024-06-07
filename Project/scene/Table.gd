extends Node3D

var tables = []
var CameraTable : String = 'CameraTable'
var selected = GlobalData.selected_table_result
# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(1, 22):
		var table_path = "CameraTable%d" % i
		if has_node(table_path):
			var table = get_node(table_path)
			tables.append(table)

	var setView = tables[selected - 1]
	setView.current = true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	get_tree().change_scene_to_file("res://scene/ChoosenTable.tscn")
	pass # Replace with function body.
