extends Node

onready var hud = get_node("CanvasLayer/HUD")

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Player_life_reduced():
	hud.update_life($Player.life)


func _on_Player_ammo_changed():
	hud.update_ammo($Player.ammo)
