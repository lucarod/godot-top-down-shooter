extends "res://scripts/Character.gd"

signal life_reduced
signal ammo_changed

var bullet_sprite = preload("res://assets/sprites/dart-sprite.png")

func _init():
	velocity = 150
	life = 6
	max_ammo = 6

func _ready():
	ammo = max_ammo
	
func _physics_process(delta):
	
	$Gun.look_at(get_global_mouse_position())
	get_input()
	motion = move_and_slide(motion)
	
func get_input():
	motion = Vector2.ZERO
	if Input.is_action_pressed("up"):
		motion.y -= 1
	if Input.is_action_pressed("down"):
		motion.y += 1
	if Input.is_action_pressed("left"):
		motion.x -= 1
	if Input.is_action_pressed("right"):
		motion.x += 1
		
	motion = motion.normalized() * velocity
	
	if Input.is_action_just_pressed("shoot"):
		if not reloading:
			if ammo > 0:
				shoot(bullet_sprite, "player")
				$ShootSound.play()
				emit_signal("ammo_changed")
			else:
				$ReloadTimerSprite.visible = true
				$ReloadTimerSprite.play()
				$ReloadSound.play()
				reload()
				reloading = true
				
	if Input.is_action_just_pressed("reload"):
		if not reloading:
			if ammo < 6:
				$ReloadTimerSprite.visible = true
				$ReloadTimerSprite.play()
				$ReloadSound.play()
				reload()
				reloading = true
		
func _on_ReloadTimerSprite_animation_finished():
	$ReloadTimerSprite.stop()
	$ReloadTimerSprite.visible = false
