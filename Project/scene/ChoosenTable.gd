extends Node3D

# Array to store all tables
var tables = []
var label
var BeginBtn
var selected_table_result

# Called when the node enters the scene tree for the first time.
func _ready():
	label = $MarginContainer/VBoxContainer/LabelSelected
	BeginBtn = $MarginContainer/VBoxContainer/BeginBtn
	# Add all tables to the array
	for i in 21:
		var table_path = "Table/Table%02d" % i
		if has_node(table_path):
			var table = get_node(table_path)
			tables.append(table)
			table.connect("input_event", Callable(self, "_on_table_input_event").bind(i))
func _on_table_input_event(camera, event, click_position, click_normal, shape_index, table_number):
	if event is InputEventMouseButton:
		var selected_table = tables[table_number - 1]
		
		if event.pressed:
			for table in tables:
				table.get_node('OmniLight3D').visible = false
				
			selected_table.get_node('OmniLight3D').visible = true
			label.text = 'Selected Table: %d' % table_number
			_on_select_table_node(table_number)

func _on_select_table_node(table_number):
	BeginBtn.visible = true
	GlobalData.selected_table_result = table_number
	#print('Selected Table %d' % table_number)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _on_begin_btn_pressed(): # when button pressed
	get_tree().change_scene_to_file("res://scene/Table.tscn")
	pass # Replace with function body.


func _on_exit_btn_pressed():
	get_tree().change_scene_to_file("res://main.tscn")
	pass # Replace with function body.
