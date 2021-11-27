extends KinematicBody2D

export var ACCELERATION = 300
export var MAX_SPEED = 50
export var FRICTION = 200
const EnemyDeathEffect = preload("res://Effects/EnemyDeathEffect.tscn")
var velocity = Vector2.ZERO

enum {
	IDLE,
	WANDER,
	CHASE
}
var state = IDLE

var knockback = Vector2.ZERO
onready var sprite = $AnimatedSprite
onready var stats = $Stats
onready var playerDetectionZone = $PlayerDetection
onready var hurtbox = $Hurtbox
onready var playerHPPlus = $"/root/PlayerStats"
onready var softCollision = $SoftCollision

func _physics_process(delta):
	knockback = knockback.move_toward(Vector2.ZERO, 200* delta)
	knockback = move_and_slide(knockback)
	match state : 
		IDLE:
			sprite.play("IDLE")
			velocity = velocity.move_toward(Vector2.ZERO, FRICTION *delta)
			seek_player()
			
		WANDER:
			pass
			
		CHASE:
			var player = playerDetectionZone.player
			if player != null:
				var direction = (player.global_position - global_position).normalized()
				velocity= velocity.move_toward(direction * MAX_SPEED, ACCELERATION * delta)
			else :
				state = IDLE
			sprite.flip_h = velocity.x < 0
			sprite.play("Move")
	if softCollision.is_colliding():
		velocity += softCollision.get_push_vector() * delta * 400
	velocity = move_and_slide(velocity)
func seek_player():
	if playerDetectionZone.can_see_player():
		state = CHASE

func _on_Hurtbox_area_entered(area):
	stats.health -= area.damage
	knockback = area.knockback_vector * 150
	hurtbox.create_hit_effect() 

func _on_Stats_no_health():
	playerHPPlus.health += 0.2
	queue_free()
	var enemyDeathEffect = EnemyDeathEffect.instance()
	get_parent().add_child(enemyDeathEffect)
	enemyDeathEffect.global_position= global_position - Vector2(0 , -12)

	
