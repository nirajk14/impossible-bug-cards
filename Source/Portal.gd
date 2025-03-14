@tool
extends Area2D

@onready var anim_player: AnimationPlayer = $AnimationPlayer
@export var Next_Scene: PackedScene

func _on_Portal_body_entered(body: PhysicsBody2D) -> void:
	teleport()


#func _get_configuration_warning() -> String:
#	return "Next Scene empty" if not Next_Scene else ""


func teleport() -> void:
	anim_player.play("fade in")
	await anim_player.animation_finished
	get_tree().change_scene_to_packed(Next_Scene)

