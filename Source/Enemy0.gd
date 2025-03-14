extends CharacterBody2D


func _on_Area2D_area_shape_entered(area_id: int, area: Area2D, area_shape: int, self_shape: int) -> void:
	set_physics_process(false)
	$AnimatedSprite2D.animation="default"
	$AnimatedSprite2D.play()
	await $AnimatedSprite2D.animation_finished
	queue_free()