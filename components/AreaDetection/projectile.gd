class_name projectile extends HitBox

@export var speed = 100
var target: CombatUnit
var current_direction = Vector2.RIGHT

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	connect("area_entered", _on_area_entered)


func _physics_process(delta):
	if not target: 
		queue_free()
		return
		#
	var direction = (target.global_position - global_position).normalized()
	look_at(target.global_position)
	global_position += direction * speed * delta


func _on_area_entered(hurtbox: HurtBox):
	queue_free()
