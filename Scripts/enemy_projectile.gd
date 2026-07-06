extends CharacterBody2D


var speed = 15000

func _physics_process(delta: float) -> void:
	velocity.y = delta * speed
	if(position.y > 648):
		queue_free()
	move_and_slide()
 


func _on_shot_area_entered(area: Area2D) -> void:
	if area.name == "player" || area.name == "shot":
		queue_free()
