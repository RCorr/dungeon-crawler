extends Area2D

@export var health = 10
var max_health = health
@export var damage = 2
@export var speed = -1

var conditions = []
var fight_node
var health_bar : int
var alive = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Targeting.z_index = 1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _input_event(viewport, event, shape_idx):
	if event.is_action_pressed("click"):
		if is_visible_in_tree():
			fight_node.change_target_enemy(self)
			targeted()

func targeted():
	$Targeting.show()
	$Targeting.play("blink")

func turn():
	fight_node.enemy_attack_player([fight_node.player], damage)
