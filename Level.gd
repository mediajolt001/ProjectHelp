extends Node3D
var ball = preload("res://ball.tscn")
var ballcnt = randf_range(3,5)
var objectcount = 0
var score = 0
var i = 0
# Called when the node enters the scene tree for the first time.
@onready var sphere = $"RigidBody3D/Sphere Body"
@onready var particle = $RigidBody3D/GPUParticles3D
@onready var sfx = $RigidBody3D/AudioStreamPlayer3D 
@onready var collisionbody3d = $"RigidBody3D/CollisionShapeSphere"
func _ready() -> void:
	for i in range(ballcnt):
		var object = ball.instantiate()
		add_child(object)

func _on_rigid_body_3d_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT && event.pressed == true:
			ball.visible = false
			particle.emitting = true
			sfx.playing = true
			Level.score += 1
			Level.objectcount -= 1
			
