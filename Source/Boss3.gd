extends CharacterBody2D
var timer =null
var bullet_delay=2
var can_shoot=true
var health=150
const enemy_knife=preload("res://Source/EnemyKnife.tscn")
const boss_knife=preload("res://Source/BossKnife.tscn")
@onready var health_display: Label =$Label
func _ready() -> void:
	update_interface()
func _physics_process(delta: float) -> void:
	timer=Timer.new()
	timer.set_one_shot(true)
	timer.set_wait_time(bullet_delay)
	timer.connect("timeout", Callable(self, "on_timeout_complete"))
	add_child(timer)
	if (can_shoot or Input.is_action_just_released("shoot")):
		var knifeA=boss_knife.instantiate()
		get_parent().add_child(knifeA)
		knifeA.position=$Marker2D.global_position
		var knifeA2=boss_knife.instantiate()
		get_parent().add_child(knifeA2)
		knifeA2.position=$Position2D2.global_position
		var knifeA3=boss_knife.instantiate()
		get_parent().add_child(knifeA3)
		knifeA3.position=$Position2D3.global_position
		var knifeA4=boss_knife.instantiate()
		get_parent().add_child(knifeA4)
		knifeA4.position=$Position2D4.global_position
		var knifeA5=boss_knife.instantiate()
		get_parent().add_child(knifeA5)
		knifeA5.position=$Position2D5.global_position
		can_shoot=false
		timer.start()

func on_timeout_complete():
	can_shoot=true
func _on_Area2D_area_shape_entered(area_id: int, area: Area2D, area_shape: int, self_shape: int) -> void:
	health-=1
	$AnimatedSprite2.animation="hit"
	$AnimatedSprite2.play()
	update_interface()
	if health<=0:
		set_physics_process(false)
		$AnimatedSprite2D.animation="default"
		$AnimatedSprite2D.play()
		await $AnimatedSprite2D.animation_finished
		queue_free()
func update_interface():
	health_display.text="%s/150" % health


func _on_Damagebox_area_shape_exited(area_id: int, area: Area2D, area_shape: int, self_shape: int) -> void:
		$AnimatedSprite2.stop()