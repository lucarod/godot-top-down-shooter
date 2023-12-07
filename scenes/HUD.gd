extends Control

var full_heart = preload("res://assets/sprites/Heart.png")
var broken_heart = preload("res://assets/sprites/Broken-Heart.png")
var empty_heart = preload("res://assets/sprites/Empty-Heart.png")

var ammo_pack_0 = preload("res://assets/sprites/Ammo-Pack/Ammo-Pack-0.png")
var ammo_pack_1 = preload("res://assets/sprites/Ammo-Pack/Ammo-Pack-1.png")
var ammo_pack_2 = preload("res://assets/sprites/Ammo-Pack/Ammo-Pack-2.png")
var ammo_pack_3 = preload("res://assets/sprites/Ammo-Pack/Ammo-Pack-3.png")
var ammo_pack_4 = preload("res://assets/sprites/Ammo-Pack/Ammo-Pack-4.png")
var ammo_pack_5 = preload("res://assets/sprites/Ammo-Pack/Ammo-Pack-5.png")
var ammo_pack_6 = preload("res://assets/sprites/Ammo-Pack/Ammo-Pack-6.png")

onready var heart_1 = get_node("HBoxContainer/Heart1")
onready var heart_2 = get_node("HBoxContainer/Heart2")
onready var heart_3 = get_node("HBoxContainer/Heart3")

onready var ammo_pack = get_node("MarginContainer/AmmoPack")

func update_life(life):
	match (life):
		0:
			heart_1.texture = empty_heart
			heart_2.texture = empty_heart
			heart_3.texture = empty_heart
		1:
			heart_1.texture = broken_heart
			heart_2.texture = empty_heart
			heart_3.texture = empty_heart
		2:
			heart_1.texture = full_heart
			heart_2.texture = empty_heart
			heart_3.texture = empty_heart
		3:
			heart_1.texture = full_heart
			heart_2.texture = broken_heart
			heart_3.texture = empty_heart
		4:
			heart_1.texture = full_heart
			heart_2.texture = full_heart
			heart_3.texture = empty_heart
		5:
			heart_1.texture = full_heart
			heart_2.texture = full_heart
			heart_3.texture = broken_heart
		6:
			heart_1.texture = full_heart
			heart_2.texture = full_heart
			heart_3.texture = full_heart

func update_ammo(ammo):
	match (ammo):
		
		0:
			ammo_pack.texture = ammo_pack_0
		1:
			ammo_pack.texture = ammo_pack_1
		2:
			ammo_pack.texture = ammo_pack_2
		3:
			ammo_pack.texture = ammo_pack_3
		4:
			ammo_pack.texture = ammo_pack_4
		5:
			ammo_pack.texture = ammo_pack_5
		6:
			ammo_pack.texture = ammo_pack_6
