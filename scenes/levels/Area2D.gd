extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var hp = 10

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


		
	pass
func _despawn():
	if hp <= 0 : 
		get_node("item_spawner").spawn()



func _on_Area2D_area_entered(area):
	hp -= 1
	if hp < 7 :
		$AnimationPlayer.play("Caja hp 7")
		pass
	if hp < 4 :
		$AnimationPlayer.play("Caja hp 4")
		
	if hp < 2 :
		$AnimationPlayer.play("Caja hp 0")
	if hp <= 0 :
		$AnimationPlayer.play("Destroy")
	
	pass # Replace with function body.




func _on_item_spawner_visibility_changed():
	hp = 0
	pass # Replace with function body.
