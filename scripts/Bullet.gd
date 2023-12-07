extends Area2D

var damage = 1
var speed = 275

func _physics_process(delta):
	position += transform.x * speed * delta

func apply_properties(texture, type):
	$Sprite.texture = texture
	if type == "player":
		set_collision_mask_bit(2, true)
	elif type == "enemy":
		set_collision_mask_bit(1, true)

func _on_Bullet_body_entered(body):
	if body.has_method("take_damage"):
		body.take_damage(damage)
	queue_free()
