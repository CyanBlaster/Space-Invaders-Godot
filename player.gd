extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var projectile = preload("res://projectile.tscn")
var charged_projectile = preload("res://charged_shot.tscn")
var charge = 0

func _physics_process(_delta: float) -> void:

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	if(Input.is_action_just_pressed("ui_accept")):
		var instance = projectile.instantiate()
		instance.position.x = position.x
		instance.position.y = position.y
		get_tree().current_scene.add_child(instance)
	if(Input.is_action_pressed("ui_accept")):
		charge += 0.1
	if(Input.is_action_just_released("ui_accept")):
		if(charge >= 3):
			var instance = charged_projectile.instantiate()
			instance.position.x = position.x
			instance.position.y = position.y
			get_tree().current_scene.add_child(instance)
		charge = 0
	
	
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
