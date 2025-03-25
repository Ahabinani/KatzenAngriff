extends Node2D
var trans
func _ready():
	self.scale = Vector2(0,0)


	
func LevelEnd():
	await get_tree().create_timer(2.5).timeout
	self.visible = true
	await get_tree().create_timer(0.6).timeout
	self.visible = false
	await get_tree().create_timer(0.4).timeout
	self.visible = true
	await get_tree().create_timer(0.6).timeout	
	self.visible = false
	await get_tree().create_timer(0.4).timeout
	self.visible = true
	await get_tree().create_timer(0.6).timeout
	self.visible = false
	await get_tree().create_timer(0.4).timeout
	self.visible = true
	await get_tree().create_timer(0.6).timeout
	self.visible = false
	await get_tree().create_timer(0.4).timeout
	self.visible = true
	for n in 60:
		get_node("Sprite2D").scale += Vector2(0.3,0.3)
		await get_tree().create_timer(0.03).timeout
	pass
