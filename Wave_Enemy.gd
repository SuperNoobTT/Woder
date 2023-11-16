extends RigidBody2D

class_name Wave_Enemy

signal dead
var wave: int
var waveEnemy: Enemy
var speed: float

func _init(wave_num, enemy_speed):
	wave = wave_num
	speed = enemy_speed
	waveEnemy = Enemy.new(wave, speed)
	waveEnemy.max_health *= 0.5
	waveEnemy.speed *= 0.8

func _notification(what):
	# The node has been removed from the scene tree.
	if what == NOTIFICATION_UNPARENTED:
		emit_signal("dead")
