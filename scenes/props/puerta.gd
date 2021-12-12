extends Area2D

export(PackedScene) var target_scene

func _ready():
	pass

func _input(event):
	if event.is_action_pressed("interact"):
		if !target_scene:
			print("no hay escena")
			return
		if get_overlapping_bodies().size() > 0:
			next_level()
			
func next_level():
	var err = get_tree().change_scene_to(target_scene)
	
	if err != OK:
		print("algo salio mal")
		
