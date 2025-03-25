extends Area2D
signal LevelFinished

func Finished(Body):
	if Body.is_in_group("Projectile"):
		get_node("LevelOver").play()
		get_parent().get_node("Schleuder").LevelFinished = true
		for n in get_parent().get_node("Schleuder").get_node("Body").get_child_count():
			get_parent().get_node("Schleuder").get_node("Body").get_child(n).sleeping = true
			get_parent().get_node("Schleuder").get_node("Body").get_child(n).gravity_scale = 0
		for m in get_parent().get_node("Blocks").get_child_count():
			get_parent().get_node("Blocks").get_child(m).sleeping = true
			get_parent().get_node("Blocks").get_child(m).gravity_scale = 0
		get_parent().get_node("Blackscreen").LevelEnd()
		await get_tree().create_timer(12).timeout
		get_tree().change_scene_to_file("res://Scenen/level_auswahl.tscn")
	pass
