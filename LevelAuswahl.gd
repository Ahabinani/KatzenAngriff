extends Node2D

var ButtonID = 0
var ButtonShiftVector = Vector2(200,0)
var ButtonPosVector = Vector2(280,200)
var LevelButton = preload("res://Scenen/level_button.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	var LevelFolder = DirAccess.open("res://Level")
	LevelFolder.list_dir_begin()
	var level_file = LevelFolder.get_next()
	while level_file != "":
		ButtonID += 1
		var ButtonInstance = LevelButton.instantiate()
		ButtonInstance.set_position(ButtonPosVector)
		ButtonInstance.get_node("TextureButton").get_node("Text").text = "[center]" + str(ButtonID)
		ButtonInstance.SetLevelPath("res://Level/" + str(level_file))
		ButtonPosVector += ButtonShiftVector
		get_node("ButtonSounds").add_child(ButtonInstance)
		level_file = LevelFolder.get_next()
	for PressButton in get_node("ButtonSounds").get_children():
		PressButton.hovered.connect(ButtonHover)
		PressButton.pressed.connect(ButtonPress)
	pass # Replace with function body.


func OnBackPress():
	get_tree().change_scene_to_file("res://Scenen/main_menu.tscn")
	pass
	
func ButtonHover():
	get_node("ButtonSounds").stream = preload("res://Assets/ButtonHover.ogg")
	get_node("ButtonSounds").play()
	pass

func ButtonPress():
	get_node("ButtonSounds").stream = preload("res://Assets/ButtonSelect.ogg")
	get_node("ButtonSounds").play()
	pass
