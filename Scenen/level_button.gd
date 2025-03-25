extends Node2D

var LevelPath = ""
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func SetLevelPath(Path):
	LevelPath = Path
	pass
signal pressed
signal hovered

func _on_button_mouse_entered():
	hovered.emit()
	
func OnButtonPress():
	pressed.emit()
	await get_tree().create_timer(1).timeout
	get_tree().change_scene_to_file(LevelPath)
	pass
