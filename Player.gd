extends CharacterBody2D

func _enter_tree():
	set_multiplayer_authority(name.to_int())

func _physics_process(delta):
	if is_multiplayer_authority():
		var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
		velocity = direction * 600
	move_and_slide()
