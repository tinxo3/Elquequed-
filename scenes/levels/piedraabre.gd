extends StaticBody2D

onready var anims = $animacion

func _on_Area2D_body_entered(body):
	if Inventory.get_item("un g") > 0 and Inventory.get_item("llave") > 0:
		anims.play("abierta")
