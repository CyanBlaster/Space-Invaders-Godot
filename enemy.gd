extends CharacterBody2D


const SPEED = 100.0
const JUMP_VELOCITY = -400.0
var direction = 1


func _physics_process(_delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.

	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	if(position.x >= 1152):
		direction = -1
		position.x = 1151
		position.y += 20
	elif(position.x <= 0):
		direction = 1
		position.x = 1
		position.y += 20

	move_and_slide()


func _on_area_2d_area_entered(area: Area2D) -> void:
	if(area.name == "shot"):
		print("hit")
		queue_free()
