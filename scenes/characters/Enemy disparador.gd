extends KinematicBody2D

onready var BULLET_SCENE = preload("res://scenes/levels/Bullet.tscn")

var player = null
var move = Vector2.ZERO
var speed = 1
export (int) var hp 

func _physics_process(delta):
	move = Vector2.ZERO
	
	if player != null:
		move = position.direction_to(player.position) * speed
	else:
		move = Vector2.ZERO

	move = move.normalized()
	move = move_and_collide(move)


func _on_Area2D_body_entered(body):
	if body != self:
		player = body

func _on_Area2D_body_exited(body):
	player = null

func fire():
	var bullet = BULLET_SCENE.instance()
	bullet.position = get_global_position()
	bullet.player = player
	get_parent().add_child(bullet)
	$Timer.set_wait_time(1)

func _on_Timer_timeout():
	if player !=null:
		fire()
#func fire():
#	var bullet = BULLET_SCENE.instance()
#	bullet.position = get_global_position()
#	bullet.player = player
#	get_parent().add_child(bullet)
#	$Timer.set_wait_tme(1)
#
#func _on_Timer_timeout():
#	if player != null:
#		fire()


func _on_hurtbox_area_entered(area):
	if area.name == "player_sword":
		hp -= 1
		if(hp <= 0):
			queue_free()
		var pushback_direction = (global_position - area.global_position).normalized()
		move_and_slide( pushback_direction * 5000)
		
	pass # Replace with function body.



	pass # Replace with function body.
