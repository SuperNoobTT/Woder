extends RigidBody2D

class_name Enemy
var health_component: GodotParadiseHealthComponent
var max_health: int 
var speed: float = 3
	
func _init(wave_num: int, enemy_speed: float):
	health_component = GodotParadiseHealthComponent.new()
	health_component.MAX_HEALTH *= 1.05*wave_num
	speed = 1.05*wave_num*enemy_speed
	


func _process(delta):
	linear_velocity.x = speed
	move_and_collide(Vector2(speed * delta, 0))


func take_damage(amount):
	health_component.damage(amount)
	
func death():
	if health_component.CURRENT_HEALTH <= 0:
		queue_free()
		


# Note: You may not need the "die" function here if it's already implemented in the health component.
