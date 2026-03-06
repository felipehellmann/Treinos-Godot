extends CharacterBody2D

var goza_rapido = 300

func _physics_process(delta: float) -> void:
	
	velocity.x = 0
	velocity.y = 0
	
	if Input.is_action_pressed("ui_up"):
		velocity.y -= goza_rapido
	
	
	move_and_collide(velocity * delta)
