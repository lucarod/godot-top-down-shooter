extends KinematicBody2D

export (PackedScene) var Bullet

var life
var max_ammo
var ammo
var velocity

var motion = Vector2.ZERO

var reloading = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
func _physics_process(delta):
	check_rotation()
	
func shoot(bullet_sprite, type):
	var bullet = Bullet.instance()
	owner.add_child(bullet)
	bullet.apply_properties(bullet_sprite, type)
	bullet.transform = $Gun/BulletSpawn.global_transform
	ammo -= 1
	
func reload():
	$ReloadTimer.start()
	
func check_rotation():

	if $Gun.rotation_degrees >= 360 or $Gun.rotation_degrees <= -360:
		$Gun.rotation_degrees = 0
		
	if $Sprite.flip_h == false:
		if ($Gun.rotation_degrees < -105 and $Gun.rotation_degrees > -180       # entrando no 2 quadrante
			or $Gun.rotation_degrees > 105 and $Gun.rotation_degrees < 180      # entrando no 3 quadrante
			or $Gun.rotation_degrees > -255 and $Gun.rotation_degrees < -180    # entrando no 3 quadrante
			or $Gun.rotation_degrees < 255 and $Gun.rotation_degrees > 180):    # entrando no 2 quadrante
				
				$Sprite.flip_h = true
				set_flipped_gun()
				
	else:
		if $Sprite.flip_h == true:
			if ($Gun.rotation_degrees < -285									# entrando no 4 quadrante
				or $Gun.rotation_degrees > 285									# entrando no 1 quadrante
				or $Gun.rotation_degrees > -75 and $Gun.rotation_degrees < 0    # entrando no 1 quadrante
				or $Gun.rotation_degrees < 75 and $Gun.rotation_degrees > 0):   # entrando no 4 quadrante

					$Sprite.flip_h = false
					set_normal_gun()
	
func set_normal_gun():
	$Gun.offset = Vector2(4, -1)
	$Gun.flip_v = false
	$Gun.position = Vector2(8, 3)
	$Gun/BulletSpawn.position.y = -4

func set_flipped_gun():
	$Gun.offset = Vector2(4, 1)
	$Gun.flip_v = true
	$Gun.position = Vector2(-8, 3)
	$Gun/BulletSpawn.position.y = 4
	
func take_damage(damage):
	life -= damage
	if is_in_group("player"):
		emit_signal("life_reduced")
	if life <= 0:
		die()
		
func die():
	queue_free()

func _on_ReloadTimer_timeout():
	ammo = max_ammo
	reloading = false
	if is_in_group("player"):
		emit_signal("ammo_changed")
