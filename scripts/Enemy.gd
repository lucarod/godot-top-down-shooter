extends "res://scripts/Character.gd"

var bullet_sprite = preload("res://assets/sprites/Enemy-Dart-Sprite.png")

onready var player_node = get_parent().get_node("Player")
var player = null

func _init():
	velocity = 50
	life = 3
	max_ammo = 5

func _ready():
	ammo = max_ammo
	pass

func _process(delta):
	if player_node:
		$Gun.look_at(player_node.global_position)
	
		if player:
			motion = position.direction_to(player.position) * velocity
		motion = move_and_slide(motion)

func _on_ShotCooldown_timeout():
	if not reloading:
		if ammo > 0:
			shoot(bullet_sprite, "enemy")
			$ShootSound.play()
		else:
			reload()
			$ReloadSound.play()
			reloading = true


func _on_AttackRange_body_entered(body):
	motion = Vector2.ZERO
	player = null


func _on_AttackRange_body_exited(body):
	player = player_node
