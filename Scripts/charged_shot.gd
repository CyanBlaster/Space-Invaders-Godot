extends projectile

var hits = 3


func _ready() -> void:
	sound.play()
	speed = 60000


func _on_shot_area_entered(area: Area2D) -> void:
	if area.name == "enemy":
		hits -= 1
		print(hits)
		if(hits <= 0):
			queue_free()
	elif area.name == "enemyfire":
		hits -= 0.5
		print(hits)
		if(hits <= 0):
			queue_free()
