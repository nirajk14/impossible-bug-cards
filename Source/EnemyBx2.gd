extends CharacterBody2D
var timer =null
var bullet_delay=2
var can_shoot=true

const enemy_knife=preload("res://Source/EnemyKnife.tscn")
func _physics_process(delta: float) -> void:
	timer=Timer.new()
	timer.set_one_shot(true)
	timer.set_wait_time(bullet_delay)
	timer.connect("timeout", Callable(self, "on_timeout_complete"))
	add_child(timer)
	if (can_shoot):
		var knife=enemy_knife.instantiate()
		get_parent().add_child(knife)
		knife.position=$Marker2D.global_position
		var knife2=enemy_knife.instantiate()
		get_parent().add_child(knife2)
		knife2.position=$Position2D2.global_position
		can_shoot=false
		timer.start()

func on_timeout_complete():
	can_shoot=true

func _on_Area2D_area_shape_entered(area_id: int, area: Area2D, area_shape: int, self_shape: int) -> void:
	set_physics_process(false)
	$AnimatedSprite2D.animation="default"
	$AnimatedSprite2D.play()
	await $AnimatedSprite2D.animation_finished
	queue_free()