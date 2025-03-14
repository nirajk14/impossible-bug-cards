extends CharacterBody2D

const enemy_knife=preload("res://Source/EnemyKnife.tscn")
func _physics_process(delta: float) -> void:
	if Input.is_action_just_released("shoot"):
		var knife=enemy_knife.instantiate()
		get_parent().add_child(knife)
		knife.position=$Marker2D.global_position



func _on_Area2D_area_shape_entered(area_id: int, area: Area2D, area_shape: int, self_shape: int) -> void:
	set_physics_process(false)
	$AnimatedSprite2D.animation="default"
	$AnimatedSprite2D.play()
	await $AnimatedSprite2D.animation_finished
	queue_free()
